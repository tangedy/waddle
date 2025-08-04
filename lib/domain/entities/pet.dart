import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet.freezed.dart';
part 'pet.g.dart';

class Pet {
  final String id;
  final String userId;
  final String name;
  final String type;
  final int level;
  final PetAppearance appearance;
  final PetStats stats;
  final DateTime createdAt;
  final DateTime? lastFedAt;
  final DateTime? lastPlayedAt;

  const Pet({
    required this.id,
    required this.userId,
    required this.name,
    required this.type,
    this.level = 1,
    required this.appearance,
    required this.stats,
    required this.createdAt,
    this.lastFedAt,
    this.lastPlayedAt,
  });

  Pet copyWith({
    String? id,
    String? userId,
    String? name,
    String? type,
    int? level,
    PetAppearance? appearance,
    PetStats? stats,
    DateTime? createdAt,
    DateTime? lastFedAt,
    DateTime? lastPlayedAt,
  }) {
    return Pet(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      type: type ?? this.type,
      level: level ?? this.level,
      appearance: appearance ?? this.appearance,
      stats: stats ?? this.stats,
      createdAt: createdAt ?? this.createdAt,
      lastFedAt: lastFedAt ?? this.lastFedAt,
      lastPlayedAt: lastPlayedAt ?? this.lastPlayedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Pet && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Pet(id: $id, name: $name, type: $type, level: $level)';
  }
}

class PetAppearance {
  final String? outfit;
  final List<String> accessories;
  final String? color;

  const PetAppearance({
    this.outfit,
    this.accessories = const [],
    this.color,
  });

  PetAppearance copyWith({
    String? outfit,
    List<String>? accessories,
    String? color,
  }) {
    return PetAppearance(
      outfit: outfit ?? this.outfit,
      accessories: accessories ?? this.accessories,
      color: color ?? this.color,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PetAppearance &&
        other.outfit == outfit &&
        other.accessories == accessories &&
        other.color == color;
  }

  @override
  int get hashCode {
    return outfit.hashCode ^
        accessories.hashCode ^
        color.hashCode;
  }

  @override
  String toString() {
    return 'PetAppearance(outfit: $outfit, accessories: $accessories, color: $color)';
  }
}

class PetStats {
  final int happiness;
  final int energy;
  final int health;

  const PetStats({
    this.happiness = 50,
    this.energy = 50,
    this.health = 50,
  });

  PetStats copyWith({
    int? happiness,
    int? energy,
    int? health,
  }) {
    return PetStats(
      happiness: happiness ?? this.happiness,
      energy: energy ?? this.energy,
      health: health ?? this.health,
    );
  }

  double get averageStats {
    return (happiness + energy + health) / 3.0;
  }

  bool get isHealthy {
    return health > 30 && energy > 30 && happiness > 30;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PetStats &&
        other.happiness == happiness &&
        other.energy == energy &&
        other.health == health;
  }

  @override
  int get hashCode {
    return happiness.hashCode ^
        energy.hashCode ^
        health.hashCode;
  }

  @override
  String toString() {
    return 'PetStats(happiness: $happiness, energy: $energy, health: $health)';
  }
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