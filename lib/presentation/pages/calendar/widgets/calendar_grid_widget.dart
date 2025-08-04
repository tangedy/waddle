import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class CalendarGridWidget extends StatelessWidget {
  const CalendarGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final firstWeekday = firstDayOfMonth.weekday;
    
    // Calculate the number of days from previous month to show
    final daysFromPreviousMonth = firstWeekday - 1;
    
    // Calculate total cells needed (previous month + current month + next month)
    final totalCells = daysFromPreviousMonth + daysInMonth;
    final rows = (totalCells / 7).ceil();
    
    return Column(
      children: List.generate(rows, (rowIndex) {
        return Expanded(
          child: Row(
            children: List.generate(7, (colIndex) {
              final cellIndex = rowIndex * 7 + colIndex;
              final dayNumber = cellIndex - daysFromPreviousMonth + 1;
              
              // Determine if this is a day from previous, current, or next month
              if (cellIndex < daysFromPreviousMonth) {
                // Previous month
                final previousMonth = DateTime(now.year, now.month - 1);
                final daysInPreviousMonth = DateTime(previousMonth.year, previousMonth.month + 1, 0).day;
                final day = daysInPreviousMonth - daysFromPreviousMonth + cellIndex + 1;
                return _buildDayCell(day, isCurrentMonth: false, isCompleted: false);
              } else if (dayNumber > daysInMonth) {
                // Next month
                final day = dayNumber - daysInMonth;
                return _buildDayCell(day, isCurrentMonth: false, isCompleted: false);
              } else {
                // Current month
                final isCompleted = _isDayCompleted(dayNumber);
                return _buildDayCell(dayNumber, isCurrentMonth: true, isCompleted: isCompleted);
              }
            }),
          ),
        );
      }),
    );
  }

  Widget _buildDayCell(int day, {required bool isCurrentMonth, required bool isCompleted}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isCompleted 
              ? AppColors.primary.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isCurrentMonth 
                      ? (isCompleted ? AppColors.primary : AppColors.onSurface)
                      : AppColors.onSurfaceVariant.withValues(alpha: 0.5),
                ),
              ),
              if (isCompleted) ...[
                const SizedBox(height: 2),
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  bool _isDayCompleted(int day) {
    // Demo logic: mark odd days as completed
    return day % 2 == 1 && day <= 15;
  }
} 