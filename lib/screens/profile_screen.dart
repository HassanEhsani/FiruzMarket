import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/theme_controller.dart'; // 👈 اضافه شده برای کنترل تم
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
    final themeController = Provider.of<ThemeController>(context); // 👈 دسترسی به کنترلر تم
    final theme = Theme.of(context); // 👈 گرفتن تم فعلی برای رنگ‌ها

    return Scaffold(
      // 👇 رنگ پس‌زمینه از تم گرفته شده تا با حالت تاریک/روشن هماهنگ باشه
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(loc.profileTitle),
        // 👇 رنگ‌ها از تم گرفته شده
        backgroundColor: theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
        foregroundColor: theme.appBarTheme.foregroundColor ?? theme.colorScheme.onSurface,
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
                    color: theme.shadowColor.withOpacity(0.2), // 👈 رنگ سایه از تم
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
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Firuz@example.com',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
            ),
            const SizedBox(height: 4),
            Text(
              '📱 07123456789',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
            ),
            Text(
              '🏠 Sanit pitersburg, Russia',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
            ),
            const SizedBox(height: 32),

            // ⚙️ تنظیمات حساب
            _buildProfileAction(
              context: context,
              icon: Icons.edit,
              label: loc.editProfile,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EditProfileScreen()),
              ),
            ),
            const SizedBox(height: 12),
            _buildProfileAction(
              context: context,
              icon: Icons.lock,
              label: loc.changePassword,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChangePasswordScreen()),
              ),
            ),
            const SizedBox(height: 12),
            _buildProfileAction(
              context: context,
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
              context: context,
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

            // 🌗 انتخاب تم (تاریک/روشن/سیستمی)
            const Divider(height: 32),
            Row(
              children: [
                const Icon(Icons.brightness_6, color: Colors.deepOrange),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButton<ThemeMode>(
                    value: themeController.themeMode,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                        value: ThemeMode.system,
                        child: Text(loc.themeSystem),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text(loc.themeLight),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text(loc.themeDark),
                      ),
                    ],
                    onChanged: (mode) {
                      if (mode != null) {
                        themeController.setThemeMode(mode); // 👈 تغییر تم
                      }
                    },
                  ),
                ),
              ],
            ),

            // 📦 فعالیت‌های کاربر
            const Divider(height: 32),
            _buildProfileAction(
              context: context,
              icon: Icons.favorite,
              label: loc.navFavorites,
              onTap: () {
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
              context: context,
              icon: Icons.shopping_bag,
              label: loc.orderHistory,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const OrderHistoryScreen()),
              ),
            ),
            const SizedBox(height: 12),
            _buildProfileAction(
              context: context,
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
              context: context,
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
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context); // 👈 گرفتن رنگ‌ها از تم

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          // 👇 رنگ پس‌زمینه از تم گرفته شده
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.05),
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
              style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
