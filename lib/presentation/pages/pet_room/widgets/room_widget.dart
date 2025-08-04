import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class RoomWidget extends StatelessWidget {
  const RoomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.outline,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Top Shelf
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.outline,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  // Penguin with headphones
                  _buildPetItem('🐧', 'Your Penguin', hasHeadphones: true),
                  const SizedBox(width: 16),
                  
                  // Lamp
                  _buildDecorationItem('💡', 'Lamp'),
                  const SizedBox(width: 16),
                  
                  // Plant
                  _buildDecorationItem('🌱', 'Plant'),
                  const Spacer(),
                  
                  // Decorative items
                  _buildDecorationItem('📚', 'Books'),
                  const SizedBox(width: 16),
                  _buildDecorationItem('🎨', 'Art'),
                ],
              ),
            ),
          ),
          
          // Bottom Shelf
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Two penguins
                  _buildPetItem('🐧', 'Lump'),
                  const SizedBox(width: 16),
                  _buildPetItem('🐧', 'Globby'),
                  const SizedBox(width: 16),
                  
                  // Books
                  _buildDecorationItem('📖', 'Books'),
                  const SizedBox(width: 16),
                  
                  // Plant
                  _buildDecorationItem('🌿', 'Plant'),
                  const Spacer(),
                  
                  // Furniture
                  _buildDecorationItem('🪑', 'Chair'),
                  const SizedBox(width: 16),
                  _buildDecorationItem('🛋️', 'Couch'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPetItem(String emoji, String name, {bool hasHeadphones = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  emoji,
                  style: const TextStyle(fontSize: 32),
                ),
              ),
            ),
            if (hasHeadphones)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.headphones,
                    color: AppColors.onSecondary,
                    size: 16,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildDecorationItem(String emoji, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.secondary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.secondary.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
} 