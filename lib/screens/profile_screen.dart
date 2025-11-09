import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'edit_profile_screen.dart';
import 'change_password_screen.dart';
import 'language_settings_screen.dart';
import 'currency_settings_screen.dart';
import 'order_history_screen.dart';
import 'saved_addresses_screen.dart';
import 'favorites_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(loc.profileTitle),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 👤 تصویر و اطلاعات کاربر
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Firuz',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Firuz@example.com',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              '📱 07123456789',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              '🏠 Sanit pitersburg, Russia',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 32),

            // ⚙️ تنظیمات حساب
            _buildProfileAction(
              icon: Icons.edit,
              label: loc.editProfile,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EditProfileScreen()),
              ),
            ),
            const SizedBox(height: 12),
            _buildProfileAction(
              icon: Icons.lock,
              label: loc.changePassword,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChangePasswordScreen()),
              ),
            ),
            const SizedBox(height: 12),
            _buildProfileAction(
              icon: Icons.language,
              label: loc.changeLanguage,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const LanguageSettingsScreen(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildProfileAction(
              icon: Icons.attach_money,
              label: loc.changeCurrency,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CurrencySettingsScreen(),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // 📦 فعالیت‌های کاربر
            const Divider(height: 32),
            _buildProfileAction(
              icon: Icons.favorite,
              label: loc.navFavorites,
              onTap: () {
                // TODO: اتصال به صفحه علاقه‌مندی‌ها
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoritesScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildProfileAction(
              icon: Icons.shopping_bag,
              label: loc.orderHistory,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const OrderHistoryScreen()),
              ),
            ),
            const SizedBox(height: 12),
            _buildProfileAction(
              icon: Icons.location_on,
              label: loc.savedAddresses,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SavedAddressesScreen()),
              ),
            ),
            const SizedBox(height: 12),

            // 🚪 خروج
            const Divider(height: 32),
            _buildProfileAction(
              icon: Icons.logout,
              label: loc.logout,
              onTap: () {
                // TODO: عملکرد خروج از حساب
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAction({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.deepOrange),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
