import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String userId,
    required String username,
    required String email,
    String? displayName,
    String? avatarUrl,
    DateTime? birthday,
    String? gender,
    double? currentWeight,
    double? goalWeight,
    double? height,
    String? activityLevel,
    @Default('metric') String units,
    @Default(0) int streakCount,
    @Default(0) int totalXP,
    @Default(1) int level,
    @Default(0) int coins,
    @Default([]) List<String> friends,
    @Default([]) List<String> followers,
    @Default([]) List<String> following,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? lastActiveAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

enum ActivityLevel {
  sedentary,
  lightlyActive,
  moderatelyActive,
  veryActive,
}

enum Gender {
  male,
  female,
  other,
  preferNotToSay,
}

enum Units {
  metric,
  imperial,
} 