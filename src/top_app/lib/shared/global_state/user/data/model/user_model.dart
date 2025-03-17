import '../../domain/entity/user_entity.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final String? profilePictureUrl;
  final String? bio;
  final DateTime createdAt;
  final int signUpSeconds;
  final List<String> goals;
  final List<String> streaks;
  final List<String> badges;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    this.profilePictureUrl,
    this.bio,
    required this.createdAt,
    required this.signUpSeconds,
    List<String>? goals,
    List<String>? streaks,
    List<String>? badges,
  })  : goals = goals ?? [],
        streaks = streaks ?? [],
        badges = badges ?? [];

  // Convert UserEntity to UserModel
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      email: entity.email,
      name: entity.name,
      profilePictureUrl: entity.profilePictureUrl,
      bio: entity.bio,
      createdAt: entity.createdAt,
      signUpSeconds: entity.signUpSeconds,
      goals: entity.goals,
      streaks: entity.streaks,
      badges: entity.badges,
    );
  }

  // Convert UserModel to UserEntity
  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      email: email,
      name: name,
      profilePictureUrl: profilePictureUrl,
      bio: bio,
      createdAt: createdAt,
      signUpSeconds: signUpSeconds,
      goals: goals,
      streaks: streaks,
      badges: badges,
    );
  }

  // Convert a map to UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      profilePictureUrl: json['profilePictureUrl'],
      bio: json['bio'],
      createdAt: DateTime.parse(json['createdAt']),
      signUpSeconds: json['signUpSeconds'],
      goals: List<String>.from(json['goals'] ?? []),
      streaks: List<String>.from(json['streaks'] ?? []),
      badges: List<String>.from(json['badges'] ?? []),
    );
  }

  // Convert UserModel to a map
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'profilePictureUrl': profilePictureUrl,
      'bio': bio,
      'createdAt': createdAt.toIso8601String(),
      'signUpSeconds': signUpSeconds,
      'goals': goals,
      'streaks': streaks,
      'badges': badges,
    };
  }
}
