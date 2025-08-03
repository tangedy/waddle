import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

@freezed
class Workout with _$Workout {
  const factory Workout({
    required String workoutId,
    required String userId,
    required DateTime date,
    required String workoutType,
    required int duration,
    required double caloriesBurned,
    double? distance,
    String? intensity,
    @Default([]) List<Exercise> exercises,
    String? imageUrl,
    String? notes,
    @Default(false) bool isPublic,
    @Default([]) List<String> likes,
    @Default([]) List<String> comments,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Workout;

  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);
}

@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    required String name,
    @Default(0) int sets,
    @Default(0) int reps,
    @Default(0.0) double weight,
    @Default(0) int duration,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);
}

enum WorkoutType {
  running,
  swimming,
  cycling,
  walking,
  strength,
  yoga,
  pilates,
  hiit,
  cardio,
  other,
}

enum WorkoutIntensity {
  low,
  medium,
  high,
} 