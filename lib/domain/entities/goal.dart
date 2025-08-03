import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal.freezed.dart';
part 'goal.g.dart';

@freezed
class Goal with _$Goal {
  const factory Goal({
    required String goalId,
    required String userId,
    required String title,
    String? description,
    required String category,
    double? targetValue,
    @Default(0.0) double currentValue,
    String? unit,
    String? frequency,
    @Default(false) bool isCompleted,
    @Default(true) bool isActive,
    DateTime? completedAt,
    DateTime? startDate,
    DateTime? targetDate,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Goal;

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);
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