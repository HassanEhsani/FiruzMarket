import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'package:firuz_market/providers/category_controller.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  File? _selectedImage;
  PlatformFile? _webImage;
  // String? selectedCategory;
  bool _submitting = false;
  String? selectedCategory; // 👈 اینجا بذار

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  String normalizeNumber(String input) {
    const faToEn = {
      '۰': '0',
      '۱': '1',
      '۲': '2',
      '۳': '3',
      '۴': '4',
      '۵': '5',
      '۶': '6',
      '۷': '7',
      '۸': '8',
      '۹': '9',
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
    };
    return input.split('').map((char) => faToEn[char] ?? char).join();
  }

  Future<void> _pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: kIsWeb,
      );

      if (result == null || result.files.isEmpty) {
        debugPrint('No image selected.');
        return;
      }

      if (kIsWeb) {
        setState(() => _webImage = result.files.first);
        debugPrint(
          'Picked web image: name=${_webImage!.name}, bytes=${_webImage!.bytes?.length}',
        );
      } else {
        final pathStr = result.files.single.path;
        if (pathStr == null || pathStr.contains('/assets/')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                'لطفاً تصویر را از کامپیوتر انتخاب کنید، نه از assets پروژه',
              ),
              backgroundColor: Colors.red.shade400,
            ),
          );
          return;
        }
        final f = File(pathStr);
        if (!await f.exists()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('فایل انتخاب‌شده وجود ندارد'),
              backgroundColor: Colors.red.shade400,
            ),
          );
          return;
        }
        setState(() => _selectedImage = f);
        debugPrint('Picked file: $pathStr');
      }
    } catch (e, st) {
      debugPrint('Error picking image: $e\n$st');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطا در انتخاب تصویر: $e'),
          backgroundColor: Colors.red.shade400,
        ),
      );
    }
  }

  Future<void> _submitProduct() async {
    if (_submitting) return;
    if (!_formKey.currentState!.validate()) return;

    final isImageSelected = kIsWeb ? _webImage != null : _selectedImage != null;
    if (!isImageSelected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('لطفاً تصویر محصول را انتخاب کنید'),
          backgroundColor: Colors.orange.shade400,
        ),
      );
      return;
    }

    if (selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('لطفاً دسته‌بندی را انتخاب کنید'),
          backgroundColor: Colors.orange.shade400,
        ),
      );
      return;
    }

    // validate price numeric
    final normalizedPrice = normalizeNumber(_priceController.text.trim());
    final price = int.tryParse(normalizedPrice);
    if (price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('قیمت را به صورت عددی وارد کنید'),
          backgroundColor: Colors.orange.shade400,
        ),
      );
      return;
    }

    setState(() => _submitting = true);

    try {
      // بررسی اینکه آیا احتمالاً به Emulator متصل هستیم
      bool isUsingEmulator = false;
      try {
        final host = FirebaseFirestore.instance.settings.host;
        if (host != null &&
            (host.contains('localhost') ||
                host.contains('127.0.0.1') ||
                host.contains('10.0.2.2'))) {
          isUsingEmulator = true;
        }
      } catch (_) {
        // بعضی پلتفرم‌ها ممکن است دسترسی به host ندهند؛ فرض بر عدم emulator در آن‌صورت
        isUsingEmulator = false;
      }

      // آماده‌سازی برای آپلود
      final uuid = const Uuid().v4();
      final originalName = kIsWeb
          ? _webImage!.name
          : path.basename(_selectedImage!.path);
      final ext = originalName.contains('.')
          ? originalName.split('.').last
          : 'jpg';
      final imageName = '$uuid.$ext';
      final storagePath = 'product_images/$imageName';
      final storageRef = FirebaseStorage.instance.ref(storagePath);
      debugPrint('Uploading to: $storagePath');

      final metadata = SettableMetadata(contentType: 'image/$ext');

      UploadTask uploadTask;
      if (kIsWeb) {
        final bytes = _webImage!.bytes;
        if (bytes == null || bytes.isEmpty) {
          throw Exception(
            'فایل وب bytes ندارد. انتخاب تصویر را دوباره انجام دهید.',
          );
        }
        uploadTask = storageRef.putData(bytes, metadata);
      } else {
        if (_selectedImage == null) {
          throw Exception('فایل محلی پیدا نشد.');
        }
        uploadTask = storageRef.putFile(_selectedImage!, metadata);
      }

      // منتظر اتمام آپلود (با timeout محافظ)
      TaskSnapshot snapshot;
      try {
        snapshot = await uploadTask.timeout(
          const Duration(seconds: 30),
          onTimeout: () {
            throw Exception('آپلود تصویر زمان‌بر شد (timeout).');
          },
        );
      } catch (e) {
        // اگر uploadTask.timeout خطا داد، تلاش برای cancel
        try {
          await uploadTask.cancel();
        } catch (_) {}
        rethrow;
      }

      debugPrint(
        'Upload state: ${snapshot.state}, transferred=${snapshot.bytesTransferred}',
      );

      if (snapshot.state != TaskState.success &&
          snapshot.state != TaskState.canceled) {
        // TaskState.success یا canceled (در حالت cancel ما خطا داده‌ایم) انتظار است
        if (snapshot.state != TaskState.success) {
          throw Exception('آپلود تصویر موفق نبود. وضعیت: ${snapshot.state}');
        }
      }

      // ساخت URL تصویر بر اساس حالت emulator یا production
      String imageUrl;
      if (isUsingEmulator) {
        // انتخاب host مناسب برای دسترسی از دستگاه:
        String hostForRequest = '127.0.0.1';
        try {
          if (!kIsWeb && Platform.isAndroid) {
            hostForRequest = '10.0.2.2';
          }
        } catch (_) {
          // Platform ممکن است در بعضی محیط‌ها دردسترس نباشد؛ از 127.0.0.1 استفاده می‌کنیم
          hostForRequest = '127.0.0.1';
        }

        // bucket name (اگر وجود نداشته باشد 'local-bucket' را استفاده می‌کنیم)
        String bucketName = 'local-bucket';
        try {
          final b = FirebaseStorage.instance.bucket;
          if (b != null && b.isNotEmpty) bucketName = b;
        } catch (_) {}

        // مسیر باید URL-encode شود
        final encodedPath = Uri.encodeComponent(storagePath);

        imageUrl =
            'http://$hostForRequest:9199/v0/b/$bucketName/o/$encodedPath?alt=media';
        debugPrint('Using emulator imageUrl: $imageUrl');
      } else {
        // production: از getDownloadURL استفاده کن
        imageUrl = await storageRef.getDownloadURL();
        debugPrint('Using production imageUrl: $imageUrl');
      }

      // ذخیره اطلاعات محصول در Firestore
      await FirebaseFirestore.instance.collection('products').add({
        'name': _nameController.text.trim(),
        'price': price,
        'imageUrl': imageUrl,
        'category': selectedCategory!,
        'createdAt': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('✅ محصول با موفقیت اضافه شد'),
          backgroundColor: Colors.green.shade600,
        ),
      );

      // پاک‌سازی فرم
      _nameController.clear();
      _priceController.clear();
      setState(() {
        _selectedImage = null;
        _webImage = null;
        selectedCategory = null;
      });
    } catch (e, st) {
      debugPrint('Submit error: $e\n$st');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطا در افزودن محصول: ${e.toString()}'),
          backgroundColor: Colors.red.shade400,
        ),
      );
    } finally {
      setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final preview = kIsWeb
        ? (_webImage != null
              ? Image.memory(_webImage!.bytes!, height: 180, fit: BoxFit.cover)
              : null)
        : (_selectedImage != null
              ? Image.file(_selectedImage!, height: 180, fit: BoxFit.cover)
              : null);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('افزودن محصول'),
          backgroundColor: const Color(0xFFB2DFDB),
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.black87,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text(
                  'اطلاعات محصول را وارد کنید',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'نام محصول',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'نام را وارد کنید'
                      : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'قیمت (روبل)',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'قیمت را وارد کنید';
                    final normalized = normalizeNumber(value.trim());
                    if (int.tryParse(normalized) == null) {
                      return 'قیمت را به صورت عددی وارد کنید';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  icon: const Icon(Icons.image),
                  label: const Text('انتخاب تصویر از کامپیوتر'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB2DFDB),
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: _pickImage,
                ),
                const SizedBox(height: 12),
                if (preview != null)
                  Container(
                    height: 180,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: preview,
                  ),
                const SizedBox(height: 16),

                // ✅ دسته‌بندی‌ها از CategoryController
                Consumer<CategoryController>(
                  builder: (context, controller, _) {
                    final categories = controller.categories;
                    print('📦 دسته‌ها: ${controller.categories}');
                    print('✅ isLoaded: ${controller.isLoaded}');

                    if (!controller.isLoaded) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (categories.isEmpty) {
                      return const Text(
                        'هیچ دسته‌ای یافت نشد',
                        style: TextStyle(color: Colors.red),
                      );
                    }

                    if (selectedCategory != null &&
                        !categories.contains(selectedCategory)) {
                      selectedCategory = null;
                    }

                    return DropdownButtonFormField<String>(
                      value: selectedCategory,
                      decoration: InputDecoration(
                        labelText: 'دسته‌بندی',
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: categories
                          .map(
                            (cat) => DropdownMenuItem<String>(
                              value: cat,
                              child: Text(cat),
                            ),
                          )
                          .toList(),
                      onChanged: (value) =>
                          setState(() => selectedCategory = value),
                      validator: (value) =>
                          value == null ? 'دسته‌بندی را انتخاب کنید' : null,
                    );
                  },
                ),

                const SizedBox(height: 32),
                ElevatedButton.icon(
                  icon: _submitting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.check),
                  label: Text(_submitting ? 'در حال ارسال...' : 'افزودن محصول'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4CAF50),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _submitting ? null : _submitProduct,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
