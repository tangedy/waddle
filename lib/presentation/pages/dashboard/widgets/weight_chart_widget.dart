import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../core/constants/colors.dart';

class WeightChartWidget extends StatelessWidget {
  const WeightChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample weight data for the last 90 days
    final weightData = [
      175.0, 174.5, 174.8, 174.2, 173.9, 173.5, 173.2,
      172.8, 172.5, 172.1, 171.8, 171.5, 171.2, 170.9,
      170.6, 170.3, 170.0, 169.7, 169.4, 169.1, 168.8,
      168.5, 168.2, 167.9, 167.6, 167.3, 167.0, 166.7,
      166.4, 166.1, 165.8, 165.5, 165.2, 164.9, 164.6,
      164.3, 164.0, 163.7, 163.4, 163.1, 162.8, 162.5,
      162.2, 161.9, 161.6, 161.3, 161.0, 160.7, 160.4,
      160.1, 159.8, 159.5, 159.2, 158.9, 158.6, 158.3,
      158.0, 157.7, 157.4, 157.1, 156.8, 156.5, 156.2,
      155.9, 155.6, 155.3, 155.0, 154.7, 154.4, 154.1,
      153.8, 153.5, 153.2, 152.9, 152.6, 152.3, 152.0,
      151.7, 151.4, 151.1, 150.8, 150.5, 150.2, 149.9,
      149.6, 149.3, 149.0, 148.7, 148.4, 148.1, 147.8,
      147.5, 147.2, 146.9, 146.6, 146.3, 146.0, 145.7,
    ];

    final spots = weightData.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value);
    }).toList();

    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 5,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: AppColors.outline.withOpacity(0.3),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 15,
                getTitlesWidget: (value, meta) {
                  if (value.toInt() % 15 == 0) {
                    return Text(
                      '${value.toInt()}',
                      style: TextStyle(
                        color: AppColors.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    );
                  }
                  return const Text('');
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 5,
                getTitlesWidget: (value, meta) {
                  return Text(
                    '${value.toInt()}',
                    style: TextStyle(
                      color: AppColors.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  );
                },
                reservedSize: 42,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: AppColors.outline.withOpacity(0.3)),
          ),
          minX: 0,
          maxX: weightData.length - 1.0,
          minY: 145,
          maxY: 180,
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.primary.withOpacity(0.8),
                ],
              ),
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.3),
                    AppColors.primary.withOpacity(0.1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 