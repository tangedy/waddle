import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/colors.dart';
import 'widgets/activity_summary_widget.dart';
import 'widgets/calorie_progress_widget.dart';
import 'widgets/macronutrients_widget.dart';
import 'widgets/missions_card_widget.dart';
import 'widgets/weekly_progress_widget.dart';
import 'widgets/weight_chart_widget.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopSection(),
              const SizedBox(height: 20),
              _buildWeeklyProgressSection(),
              const SizedBox(height: 7),
              _buildMainContentGrid(),
              const SizedBox(height: 7),
              _buildMacronutrientsSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAppTitleWithStreak(),
        _buildProfileAvatar(),
      ],
    );
  }

  Widget _buildAppTitleWithStreak() {
    return Row(
      children: [
        const Text(
          'Waddle',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.onBackground,
          ),
        ),
        const SizedBox(width: 8),
        const Icon(
          Icons.local_fire_department,
          color: AppColors.secondary,
          size: 24,
        ),
        const SizedBox(width: 4),
        const Text(
          '15',
          style: TextStyle(
            color: AppColors.onBackground,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileAvatar() {
    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColors.primary,
      child: const Icon(
        Icons.person,
        color: AppColors.onPrimary,
        size: 24,
      ),
    );
  }

  Widget _buildWeeklyProgressSection() {
    return const WeeklyProgressWidget();
  }

  Widget _buildMainContentGrid() {
    return Column(
      children: [
        // Row 1: Penguin icon + Missions card (3:4 ratio)
        Row(
          children: [
            _buildPenguinCard(),
            const SizedBox(width: 7),
            Expanded(
              flex: 4,
              child: _buildMissionsCard(),
            ),
          ],
        ),
        const SizedBox(height: 7),
        // Row 2: Calories card (full width)
        _buildCaloriesCard(),
        const SizedBox(height: 7),
        // Row 3: Exercise + Steps (left, stacked) + Weight (right)
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  _buildExerciseCard(),
                  const SizedBox(height: 7),
                  _buildStepsCard(),
                ],
              ),
            ),
            const SizedBox(width: 7),
            Expanded(
              child: _buildWeightCard(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPenguinCard() {
    return Expanded(
      flex: 3,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          height: 140,
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: AppColors.outline,
                  width: 1,
                ),
              ),
              child: const Center(
                child: Text(
                  '🐧',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMissionsCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'MISSIONS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            _buildProgressBar(),
            const SizedBox(height: 12),
            Expanded(
              child: _buildMissionsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      height: 8,
      decoration: BoxDecoration(
        color: AppColors.outline,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMissionsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMissionItem('Daily run', true),
        const SizedBox(height: 6),
        _buildMissionItem('Stretches', true),
        const SizedBox(height: 6),
        _buildMissionItem('Log food', false),
      ],
    );
  }

  Widget _buildMissionItem(String text, bool isCompleted) {
    return Row(
      children: [
        Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isCompleted ? AppColors.primary : AppColors.onSurfaceVariant,
          size: 16,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: isCompleted ? AppColors.onSurface : AppColors.onSurfaceVariant,
              fontWeight: isCompleted ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCaloriesCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            _buildCalorieProgress(),
            const SizedBox(width: 20),
            _buildCalorieText(),
          ],
        ),
      ),
    );
  }

  Widget _buildCalorieProgress() {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          CircularProgressIndicator(
            value: 0.85,
            strokeWidth: 8,
            backgroundColor: AppColors.outline,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
          const Center(
            child: Icon(
              Icons.restaurant,
              color: AppColors.secondary,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalorieText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '1000',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.onSurface,
          ),
        ),
        Text(
          'Calories left',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.fitness_center,
                  color: AppColors.onSurface,
                  size: 20,
                ),
                const SizedBox(width: 8),
                const Text(
                  '50 mins',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.local_fire_department,
                  color: AppColors.secondary,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '370 cals',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepsCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2156 steps',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '7km distance',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 227, // Same height as exercise + steps cards + gap
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    'Weight last 90 days',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.onSurface,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.edit,
                  color: AppColors.onSurfaceVariant,
                  size: 18,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Expanded(
              child: WeightChartWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMacronutrientsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Macronutrients Today',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        const MacronutrientsWidget(),
      ],
    );
  }
} 