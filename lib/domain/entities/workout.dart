import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

class Workout {
  final String id;
  final String userId;
  final DateTime date;
  final String workoutType;
  final int duration;
  final int caloriesBurned;
  final double? distance;
  final String intensity;
  final List<Exercise>? exercises;
  final String? imageUrl;
  final String? notes;
  final bool isPublic;
  final List<String> likes;
  final List<String> comments;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Workout({
    required this.id,
    required this.userId,
    required this.date,
    required this.workoutType,
    required this.duration,
    required this.caloriesBurned,
    this.distance,
    this.intensity = 'medium',
    this.exercises,
    this.imageUrl,
    this.notes,
    this.isPublic = false,
    this.likes = const [],
    this.comments = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  Workout copyWith({
    String? id,
    String? userId,
    DateTime? date,
    String? workoutType,
    int? duration,
    int? caloriesBurned,
    double? distance,
    String? intensity,
    List<Exercise>? exercises,
    String? imageUrl,
    String? notes,
    bool? isPublic,
    List<String>? likes,
    List<String>? comments,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Workout(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      workoutType: workoutType ?? this.workoutType,
      duration: duration ?? this.duration,
      caloriesBurned: caloriesBurned ?? this.caloriesBurned,
      distance: distance ?? this.distance,
      intensity: intensity ?? this.intensity,
      exercises: exercises ?? this.exercises,
      imageUrl: imageUrl ?? this.imageUrl,
      notes: notes ?? this.notes,
      isPublic: isPublic ?? this.isPublic,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Workout && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Workout(id: $id, type: $workoutType, duration: $duration, calories: $caloriesBurned)';
  }
}

class Exercise {
  final String name;
  final int? sets;
  final int? reps;
  final double? weight;
  final int? duration;

  const Exercise({
    required this.name,
    this.sets,
    this.reps,
    this.weight,
    this.duration,
  });

  Exercise copyWith({
    String? name,
    int? sets,
    int? reps,
    double? weight,
    int? duration,
  }) {
    return Exercise(
      name: name ?? this.name,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      duration: duration ?? this.duration,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Exercise &&
        other.name == name &&
        other.sets == sets &&
        other.reps == reps &&
        other.weight == weight &&
        other.duration == duration;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        sets.hashCode ^
        reps.hashCode ^
        weight.hashCode ^
        duration.hashCode;
  }

  @override
  String toString() {
    return 'Exercise(name: $name, sets: $sets, reps: $reps, weight: $weight, duration: $duration)';
  }
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