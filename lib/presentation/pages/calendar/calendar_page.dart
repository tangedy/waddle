import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/colors.dart';
import 'widgets/calendar_grid_widget.dart';

class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final currentMonth = DateTime(now.year, now.month);
    
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          DateFormat('MMMM yyyy').format(currentMonth),
          style: const TextStyle(
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
              // TODO: Implement month navigation
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.onSurface,
              size: 20,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            // TODO: Implement month navigation
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.onSurface,
            size: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Week Labels
              _buildWeekLabels(),
              const SizedBox(height: 16),
              
              // Calendar Grid
              const Expanded(
                child: CalendarGridWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeekLabels() {
    const weekDays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    
    return Row(
      children: weekDays.map((day) {
        return Expanded(
          child: Center(
            child: Text(
              day,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
} 