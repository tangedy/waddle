import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/colors.dart';
import '../modals/logging_modal.dart';

class BottomNavigationWrapper extends ConsumerStatefulWidget {
  final Widget child;

  const BottomNavigationWrapper({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<BottomNavigationWrapper> createState() => _BottomNavigationWrapperState();
}

class _BottomNavigationWrapperState extends ConsumerState<BottomNavigationWrapper> {
  int _currentIndex = 0;

  final List<NavigationItem> _navigationItems = const [
    NavigationItem(
      icon: Icons.home,
      label: 'Home',
      route: '/',
      isActionButton: false,
    ),
    NavigationItem(
      icon: Icons.calendar_today,
      label: 'Calendar',
      route: '/calendar',
      isActionButton: false,
    ),
    NavigationItem(
      icon: Icons.add_circle_outline,
      label: 'Log',
      route: '/log',
      isActionButton: true,
    ),
    NavigationItem(
      icon: Icons.pets,
      label: 'Pet Room',
      route: '/pet-room',
      isActionButton: false,
    ),
    NavigationItem(
      icon: Icons.settings,
      label: 'Settings',
      route: '/settings',
      isActionButton: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavigationTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.onSurfaceVariant,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        items: _buildNavigationItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildNavigationItems() {
    return _navigationItems.map((item) {
      return BottomNavigationBarItem(
        icon: Icon(item.icon),
        label: item.label,
      );
    }).toList();
  }

  void _onNavigationTap(int index) {
    final item = _navigationItems[index];
    
    if (item.isActionButton) {
      _showLoggingModal();
    } else {
      setState(() {
        _currentIndex = index;
      });
      context.go(item.route);
    }
  }

  void _showLoggingModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const LoggingModal(),
    );
  }
}

class NavigationItem {
  final IconData icon;
  final String label;
  final String route;
  final bool isActionButton;

  const NavigationItem({
    required this.icon,
    required this.label,
    required this.route,
    this.isActionButton = false,
  });
} 