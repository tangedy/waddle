import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal.freezed.dart';
part 'meal.g.dart';

class Meal {
  final String id;
  final String userId;
  final DateTime date;
  final String mealType;
  final String name;
  final int calories;
  final Macronutrients macronutrients;
  final String? imageUrl;
  final ImageAnalysis? imageAnalysis;
  final String? notes;
  final bool isCustom;
  final bool isPublic;
  final List<String> likes;
  final List<String> comments;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Meal({
    required this.id,
    required this.userId,
    required this.date,
    required this.mealType,
    required this.name,
    required this.calories,
    required this.macronutrients,
    this.imageUrl,
    this.imageAnalysis,
    this.notes,
    this.isCustom = false,
    this.isPublic = false,
    this.likes = const [],
    this.comments = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  Meal copyWith({
    String? id,
    String? userId,
    DateTime? date,
    String? mealType,
    String? name,
    int? calories,
    Macronutrients? macronutrients,
    String? imageUrl,
    ImageAnalysis? imageAnalysis,
    String? notes,
    bool? isCustom,
    bool? isPublic,
    List<String>? likes,
    List<String>? comments,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Meal(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      mealType: mealType ?? this.mealType,
      name: name ?? this.name,
      calories: calories ?? this.calories,
      macronutrients: macronutrients ?? this.macronutrients,
      imageUrl: imageUrl ?? this.imageUrl,
      imageAnalysis: imageAnalysis ?? this.imageAnalysis,
      notes: notes ?? this.notes,
      isCustom: isCustom ?? this.isCustom,
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
    return other is Meal && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Meal(id: $id, name: $name, calories: $calories)';
  }
}

class Macronutrients {
  final double carbohydrates;
  final double protein;
  final double fats;
  final double fiber;

  const Macronutrients({
    required this.carbohydrates,
    required this.protein,
    required this.fats,
    required this.fiber,
  });

  Macronutrients copyWith({
    double? carbohydrates,
    double? protein,
    double? fats,
    double? fiber,
  }) {
    return Macronutrients(
      carbohydrates: carbohydrates ?? this.carbohydrates,
      protein: protein ?? this.protein,
      fats: fats ?? this.fats,
      fiber: fiber ?? this.fiber,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Macronutrients &&
        other.carbohydrates == carbohydrates &&
        other.protein == protein &&
        other.fats == fats &&
        other.fiber == fiber;
  }

  @override
  int get hashCode {
    return carbohydrates.hashCode ^
        protein.hashCode ^
        fats.hashCode ^
        fiber.hashCode;
  }

  @override
  String toString() {
    return 'Macronutrients(carbs: $carbohydrates, protein: $protein, fats: $fats, fiber: $fiber)';
  }
}

class ImageAnalysis {
  final double confidence;
  final List<String> detectedFoods;
  final String mlModel;

  const ImageAnalysis({
    required this.confidence,
    required this.detectedFoods,
    required this.mlModel,
  });

  ImageAnalysis copyWith({
    double? confidence,
    List<String>? detectedFoods,
    String? mlModel,
  }) {
    return ImageAnalysis(
      confidence: confidence ?? this.confidence,
      detectedFoods: detectedFoods ?? this.detectedFoods,
      mlModel: mlModel ?? this.mlModel,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ImageAnalysis &&
        other.confidence == confidence &&
        other.detectedFoods == detectedFoods &&
        other.mlModel == mlModel;
  }

  @override
  int get hashCode {
    return confidence.hashCode ^
        detectedFoods.hashCode ^
        mlModel.hashCode;
  }

  @override
  String toString() {
    return 'ImageAnalysis(confidence: $confidence, detectedFoods: $detectedFoods, mlModel: $mlModel)';
  }
}

enum MealType {
  breakfast,
  lunch,
  dinner,
  snack,
} 