import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class ActivitySummaryWidget extends StatelessWidget {
  const ActivitySummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Workout Stats
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildActivityItem(
                icon: Icons.fitness_center,
                value: '50 mins',
                label: 'Duration',
                color: AppColors.primary,
              ),
              const SizedBox(height: 12),
              _buildActivityItem(
                icon: Icons.local_fire_department,
                value: '370 cals',
                label: 'Calories burned',
                color: AppColors.secondary,
              ),
            ],
          ),
        ),
        
        const SizedBox(width: 24),
        
        // Steps Counter
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildActivityItem(
                icon: Icons.directions_walk,
                value: '2156',
                label: 'steps',
                color: AppColors.primary,
              ),
              const SizedBox(height: 12),
              _buildActivityItem(
                icon: Icons.straighten,
                value: '7km',
                label: 'distance',
                color: AppColors.secondary,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 18,
            color: color,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurface,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 