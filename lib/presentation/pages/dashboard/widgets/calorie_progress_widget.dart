import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class CalorieProgressWidget extends StatelessWidget {
  const CalorieProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const double progress = 0.5; // 50% progress (1000 calories consumed out of 2000)
    const int caloriesConsumed = 1000;
    const int caloriesGoal = 2000;
    const int caloriesRemaining = caloriesGoal - caloriesConsumed;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Circle
          SizedBox(
            width: 200,
            height: 200,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: 12,
              backgroundColor: AppColors.progressBackground,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.transparent),
            ),
          ),
          
          // Progress Circle
          SizedBox(
            width: 200,
            height: 200,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 12,
              backgroundColor: Colors.transparent,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.progressFill),
            ),
          ),
          
          // Center Content
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                caloriesRemaining.toString(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onBackground,
                ),
              ),
              const Text(
                'Calories left',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          
          // Progress Dot
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: AppColors.error,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 