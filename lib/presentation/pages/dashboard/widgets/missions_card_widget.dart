import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class MissionsCardWidget extends StatelessWidget {
  const MissionsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // MISSIONS Header with Progress Bar
        Row(
          children: [
            const Text(
              'MISSIONS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface,
              ),
            ),
            const Spacer(),
            Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.progressBackground,
                borderRadius: BorderRadius.circular(2),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.6, // 60% progress
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.progressFill,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        
        // Mission Items
        _buildMissionItem('Daily run', true),
        const SizedBox(height: 8),
        _buildMissionItem('Stretches', true),
        const SizedBox(height: 8),
        _buildMissionItem('Log food', false),
      ],
    );
  }

  Widget _buildMissionItem(String title, bool isCompleted) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted ? AppColors.primary : Colors.transparent,
            border: Border.all(
              color: isCompleted ? AppColors.primary : AppColors.outline,
              width: 2,
            ),
          ),
          child: isCompleted
              ? const Icon(
                  Icons.check,
                  size: 14,
                  color: AppColors.onPrimary,
                )
              : null,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.onSurface,
              decoration: isCompleted ? TextDecoration.lineThrough : null,
              decorationColor: AppColors.onSurfaceVariant,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            // TODO: Implement remove mission functionality
          },
          icon: const Icon(
            Icons.close,
            size: 16,
            color: AppColors.onSurfaceVariant,
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            minWidth: 24,
            minHeight: 24,
          ),
        ),
      ],
    );
  }
} 