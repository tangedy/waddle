import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet.freezed.dart';
part 'pet.g.dart';

@freezed
class Pet with _$Pet {
  const factory Pet({
    required String petId,
    required String userId,
    required String name,
    @Default('penguin') String type,
    @Default(1) int level,
    required PetAppearance appearance,
    required PetStats stats,
    required DateTime createdAt,
    DateTime? lastFedAt,
    DateTime? lastPlayedAt,
  }) = _Pet;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
}

@freezed
class PetAppearance with _$PetAppearance {
  const factory PetAppearance({
    @Default('') String outfit,
    @Default([]) List<String> accessories,
    @Default('default') String color,
  }) = _PetAppearance;

  factory PetAppearance.fromJson(Map<String, dynamic> json) => _$PetAppearanceFromJson(json);
}

@freezed
class PetStats with _$PetStats {
  const factory PetStats({
    @Default(100) int happiness,
    @Default(100) int energy,
    @Default(100) int health,
  }) = _PetStats;

  factory PetStats.fromJson(Map<String, dynamic> json) => _$PetStatsFromJson(json);
}

@freezed
class PetItem with _$PetItem {
  const factory PetItem({
    required String itemId,
    required String name,
    required String type,
    required String rarity,
    @Default(1) int quantity,
    @Default(false) bool isEquipped,
    String? equippedOnPetId,
  }) = _PetItem;

  factory PetItem.fromJson(Map<String, dynamic> json) => _$PetItemFromJson(json);
}

enum PetType {
  penguin,
}

enum ItemType {
  outfit,
  accessory,
  furniture,
  decoration,
}

enum ItemRarity {
  common,
  rare,
  epic,
  legendary,
} 