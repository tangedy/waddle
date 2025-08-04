import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/colors.dart';
import 'widgets/friends_widget.dart';
import 'widgets/room_widget.dart';

class PetRoomPage extends ConsumerStatefulWidget {
  const PetRoomPage({super.key});

  @override
  ConsumerState<PetRoomPage> createState() => _PetRoomPageState();
}

class _PetRoomPageState extends ConsumerState<PetRoomPage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopNavigation(),
            Expanded(
              child: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        'Erin\'s Room',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.onSurface,
        ),
      ),
      backgroundColor: AppColors.surface,
      elevation: 0,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            // TODO: Implement settings
          },
          icon: const Icon(
            Icons.settings,
            color: AppColors.onSurface,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildTopNavigation() {
    final tabs = [
      {'icon': Icons.shopping_bag, 'label': 'Shop'},
      {'icon': Icons.inventory, 'label': 'Items'},
      {'icon': Icons.pets, 'label': 'Pet'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: BorderSide(
            color: AppColors.outline,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isSelected = index == _selectedTabIndex;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected ? AppColors.primary : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      tab['icon'] as IconData,
                      color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
                      size: 24,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tab['label'] as String,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _buildShopTab();
      case 1:
        return _buildItemsTab();
      case 2:
        return _buildPetTab();
      default:
        return _buildShopTab();
    }
  }

  Widget _buildShopTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag,
            size: 64,
            color: AppColors.onSurfaceVariant,
          ),
          SizedBox(height: 16),
          Text(
            'Shop',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Purchase items for your pet',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory,
            size: 64,
            color: AppColors.onSurfaceVariant,
          ),
          SizedBox(height: 16),
          Text(
            'Inventory',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Manage your pet\'s items',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPetTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Expanded(
            flex: 2,
            child: RoomWidget(),
          ),
          const SizedBox(height: 16),
          const Expanded(
            flex: 1,
            child: FriendsWidget(),
          ),
        ],
      ),
    );
  }
} 