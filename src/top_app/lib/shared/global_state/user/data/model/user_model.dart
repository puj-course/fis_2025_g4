import 'package:top_app/shared/models/templates/goal_model.dart';

import '../../domain/entity/user_entity.dart';
import '../../../../models/user_specific/user_badge_model.dart';
import '../../../../models/user_specific/user_challenge_model.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String bio;
  final DateTime createdAt;
  final String profilePictureUrl;
  final int signUpSeconds;
  final List<GoalModel> goals;
  final List<UserBadgeModel> badges;
  final List<UserChallengeModel> challenges;
  final List<String> posts;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.bio,
    required this.createdAt,
    required this.profilePictureUrl,
    required this.signUpSeconds,
    List<GoalModel>? goals,
    List<UserBadgeModel>? badges,
    List<UserChallengeModel>? challenges,
    List<String>? posts,
  })  : goals = goals ?? [],
        badges = badges ?? [],
        challenges = challenges ?? [],
        posts = posts ?? [];

  // Convert UserEntity to UserModel
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      name: entity.name,
      email: entity.email,
      bio: entity.bio ?? '',
      createdAt: entity.createdAt,
      profilePictureUrl: entity.profilePictureUrl ?? '',
      signUpSeconds: entity.signUpSeconds,
      goals: entity.goals.map((g) => GoalModel.fromEntity(g)).toList(),
      badges: entity.badges.map((b) => UserBadgeModel.fromEntity(b)).toList(),
      challenges: entity.challenges.map((c) => UserChallengeModel.fromEntity(c)).toList(),
      posts: entity.posts,
    );
  }

  // Convert UserModel to UserEntity
  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      name: name,
      email: email,
      bio: bio,
      createdAt: createdAt,
      profilePictureUrl: profilePictureUrl,
      signUpSeconds: signUpSeconds,
      goals: goals.map((g) => g.toEntity()).toList(),
      badges: badges.map((b) => b.toEntity()).toList(),
      challenges: challenges.map((c) => c.toEntity()).toList(),
      posts: posts,
    );
  }

  // Convert a map to UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      bio: json['bio'],
      createdAt: DateTime.parse(json['createdAt']),
      profilePictureUrl: json['profilePictureUrl'],
      signUpSeconds: json['signUpSeconds'],
      goals: (json['goals'] as List?)?.map((g) => GoalModel.fromJson(g)).toList() ?? [],
      badges: (json['badges'] as List?)?.map((b) => UserBadgeModel.fromJson(b)).toList() ?? [],
      challenges:
          (json['challenges'] as List?)?.map((c) => UserChallengeModel.fromJson(c)).toList() ?? [],
      posts: List<String>.from(json['posts'] ?? []),
    );
  }

  // Convert UserModel to a map
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'bio': bio,
      'createdAt': createdAt.toIso8601String(),
      'profilePictureUrl': profilePictureUrl,
      'signUpSeconds': signUpSeconds,
      'goals': goals.map((g) => g.toJson()).toList(),
      'badges': badges.map((b) => b.toJson()).toList(),
      'challenges': challenges.map((c) => c.toJson()).toList(),
      'posts': posts,
    };
  }
}
