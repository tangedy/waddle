import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal.freezed.dart';
part 'meal.g.dart';

@freezed
class Meal with _$Meal {
  const factory Meal({
    required String mealId,
    required String userId,
    required DateTime date,
    required String mealType,
    required String name,
    required double calories,
    required Macronutrients macronutrients,
    String? imageUrl,
    ImageAnalysis? imageAnalysis,
    String? notes,
    @Default(false) bool isCustom,
    @Default(false) bool isPublic,
    @Default([]) List<String> likes,
    @Default([]) List<String> comments,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}

@freezed
class Macronutrients with _$Macronutrients {
  const factory Macronutrients({
    @Default(0.0) double carbohydrates,
    @Default(0.0) double protein,
    @Default(0.0) double fats,
    @Default(0.0) double fiber,
  }) = _Macronutrients;

  factory Macronutrients.fromJson(Map<String, dynamic> json) => _$MacronutrientsFromJson(json);
}

@freezed
class ImageAnalysis with _$ImageAnalysis {
  const factory ImageAnalysis({
    @Default(0.0) double confidence,
    @Default([]) List<String> detectedFoods,
    @Default('') String mlModel,
  }) = _ImageAnalysis;

  factory ImageAnalysis.fromJson(Map<String, dynamic> json) => _$ImageAnalysisFromJson(json);
}

enum MealType {
  breakfast,
  lunch,
  dinner,
  snack,
} 