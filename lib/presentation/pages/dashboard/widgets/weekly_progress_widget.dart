import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class WeeklyProgressWidget extends StatelessWidget {
  const WeeklyProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(7, (index) {
        final dayNumber = 15 + index; // Days 15-21 as shown in mockup
        final isCompleted = index < 5; // First 5 days completed for demo
        
        return Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isCompleted ? AppColors.primary : AppColors.outline,
                  width: 2,
                ),
                color: isCompleted ? AppColors.primary : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  dayNumber.toString(),
                  style: TextStyle(
                    color: isCompleted ? AppColors.onPrimary : AppColors.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              _getDayLabel(index),
              style: TextStyle(
                color: AppColors.onSurfaceVariant,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      }),
    );
  }

  String _getDayLabel(int index) {
    const days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return days[index];
  }
} 