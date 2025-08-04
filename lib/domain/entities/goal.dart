import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal.freezed.dart';
part 'goal.g.dart';

class Goal {
  final String id;
  final String userId;
  final String title;
  final String description;
  final String category;
  final double targetValue;
  final double currentValue;
  final String unit;
  final String frequency;
  final bool isCompleted;
  final bool isActive;
  final DateTime? completedAt;
  final DateTime startDate;
  final DateTime? targetDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Goal({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.category,
    required this.targetValue,
    this.currentValue = 0.0,
    required this.unit,
    required this.frequency,
    this.isCompleted = false,
    this.isActive = true,
    this.completedAt,
    required this.startDate,
    this.targetDate,
    required this.createdAt,
    required this.updatedAt,
  });

  Goal copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    String? category,
    double? targetValue,
    double? currentValue,
    String? unit,
    String? frequency,
    bool? isCompleted,
    bool? isActive,
    DateTime? completedAt,
    DateTime? startDate,
    DateTime? targetDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Goal(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      targetValue: targetValue ?? this.targetValue,
      currentValue: currentValue ?? this.currentValue,
      unit: unit ?? this.unit,
      frequency: frequency ?? this.frequency,
      isCompleted: isCompleted ?? this.isCompleted,
      isActive: isActive ?? this.isActive,
      completedAt: completedAt ?? this.completedAt,
      startDate: startDate ?? this.startDate,
      targetDate: targetDate ?? this.targetDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  double get progressPercentage {
    if (targetValue == 0) return 0.0;
    return (currentValue / targetValue).clamp(0.0, 1.0);
  }

  bool get isOverdue {
    if (targetDate == null) return false;
    return DateTime.now().isAfter(targetDate!) && !isCompleted;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Goal && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Goal(id: $id, title: $title, progress: ${(progressPercentage * 100).toStringAsFixed(1)}%)';
  }
}

enum GoalCategory {
  health,
  diet,
  fitness,
  custom,
}

enum GoalFrequency {
  daily,
  weekly,
  monthly,
  yearly,
} 