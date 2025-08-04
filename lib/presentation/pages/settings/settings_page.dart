import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/colors.dart';
import 'widgets/settings_tile_widget.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool _isMetric = true;
  bool _notificationsEnabled = true;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.onSurface,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Information Section
              _buildSectionTitle('Profile Information'),
              const SizedBox(height: 16),
              
              _buildProfileSection(),
              const SizedBox(height: 32),
              
              // App Settings Section
              _buildSectionTitle('App Settings'),
              const SizedBox(height: 16),
              
              _buildAppSettingsSection(),
              const SizedBox(height: 32),
              
              // Action Buttons
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
      ),
    );
  }

  Widget _buildProfileSection() {
    return Card(
      child: Column(
        children: [
          SettingsTile(
            icon: Icons.cake,
            title: 'Birthday',
            subtitle: 'birthday - lmfao/05/2025',
            trailing: const Icon(
              Icons.edit,
              color: AppColors.primary,
              size: 20,
            ),
            onTap: () {
              // TODO: Implement edit birthday
            },
          ),
          const Divider(height: 1),
          SettingsTile(
            icon: Icons.email,
            title: 'Email',
            subtitle: 'waddle@example.com',
            trailing: const Icon(
              Icons.edit,
              color: AppColors.primary,
              size: 20,
            ),
            onTap: () {
              // TODO: Implement edit email
            },
          ),
          const Divider(height: 1),
          SettingsTile(
            icon: Icons.lock,
            title: 'Password',
            subtitle: _showPassword ? 'password123' : '••••••••••••',
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              icon: Icon(
                _showPassword ? Icons.visibility_off : Icons.visibility,
                color: AppColors.primary,
                size: 20,
              ),
            ),
            onTap: () {
              // TODO: Implement change password
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAppSettingsSection() {
    return Card(
      child: Column(
        children: [
          SettingsTile(
            icon: Icons.straighten,
            title: 'Units',
            subtitle: _isMetric ? 'Metric' : 'Imperial',
            trailing: Switch(
              value: _isMetric,
              onChanged: (value) {
                setState(() {
                  _isMetric = value;
                });
              },
              activeColor: AppColors.primary,
            ),
            onTap: () {
              setState(() {
                _isMetric = !_isMetric;
              });
            },
          ),
          const Divider(height: 1),
          SettingsTile(
            icon: Icons.notifications,
            title: 'Notifications',
            subtitle: _notificationsEnabled ? 'Enabled' : 'Disabled',
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              activeColor: AppColors.primary,
            ),
            onTap: () {
              setState(() {
                _notificationsEnabled = !_notificationsEnabled;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              // TODO: Implement cancel functionality
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.onSurface,
              side: const BorderSide(color: AppColors.outline),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // TODO: Implement save functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Settings saved successfully!'),
                  backgroundColor: AppColors.primary,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
} 