import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

class User {
  final String id;
  final String username;
  final String email;
  final String? displayName;
  final String? avatarUrl;
  final DateTime? birthday;
  final String? gender;
  final double? currentWeight;
  final double? goalWeight;
  final double? height;
  final String? activityLevel;
  final String units;
  final Map<String, bool> notifications;
  final int streakCount;
  final int totalXP;
  final int level;
  final int coins;
  final List<String> friends;
  final List<String> followers;
  final List<String> following;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastActiveAt;

  const User({
    required this.id,
    required this.username,
    required this.email,
    this.displayName,
    this.avatarUrl,
    this.birthday,
    this.gender,
    this.currentWeight,
    this.goalWeight,
    this.height,
    this.activityLevel,
    this.units = 'metric',
    this.notifications = const {
      'dailyReminders': true,
      'weeklyReports': true,
      'socialInteractions': true,
    },
    this.streakCount = 0,
    this.totalXP = 0,
    this.level = 1,
    this.coins = 0,
    this.friends = const [],
    this.followers = const [],
    this.following = const [],
    required this.createdAt,
    required this.updatedAt,
    this.lastActiveAt,
  });

  User copyWith({
    String? id,
    String? username,
    String? email,
    String? displayName,
    String? avatarUrl,
    DateTime? birthday,
    String? gender,
    double? currentWeight,
    double? goalWeight,
    double? height,
    String? activityLevel,
    String? units,
    Map<String, bool>? notifications,
    int? streakCount,
    int? totalXP,
    int? level,
    int? coins,
    List<String>? friends,
    List<String>? followers,
    List<String>? following,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastActiveAt,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
      currentWeight: currentWeight ?? this.currentWeight,
      goalWeight: goalWeight ?? this.goalWeight,
      height: height ?? this.height,
      activityLevel: activityLevel ?? this.activityLevel,
      units: units ?? this.units,
      notifications: notifications ?? this.notifications,
      streakCount: streakCount ?? this.streakCount,
      totalXP: totalXP ?? this.totalXP,
      level: level ?? this.level,
      coins: coins ?? this.coins,
      friends: friends ?? this.friends,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastActiveAt: lastActiveAt ?? this.lastActiveAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email)';
  }
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