import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class MacronutrientsWidget extends StatelessWidget {
  const MacronutrientsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 2.5,
      children: [
        _buildMacroCard(
          title: 'Carbohydrates',
          value: '173g',
          icon: Icons.grain,
          color: AppColors.carbs,
        ),
        _buildMacroCard(
          title: 'Protein',
          value: '173g',
          icon: Icons.restaurant,
          color: AppColors.protein,
        ),
        _buildMacroCard(
          title: 'Fats',
          value: '173g',
          icon: Icons.opacity,
          color: AppColors.fats,
        ),
        _buildMacroCard(
          title: 'Fiber',
          value: '18g',
          icon: Icons.eco,
          color: AppColors.fiber,
        ),
      ],
    );
  }

  Widget _buildMacroCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 