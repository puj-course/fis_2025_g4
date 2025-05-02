import 'package:top_app/shared/entities/templates/goal.dart';
import 'package:top_app/shared/entities/templates/post.dart';
import 'package:top_app/shared/entities/user_specific/user_badge.dart';
import 'package:top_app/shared/entities/user_specific/user_challenge.dart';
import 'package:top_app/shared/models/templates/goal_model.dart';

import '../../domain/entity/user_entity.dart';
import '../../../../models/user_specific/user_badge_model.dart';
import '../../../../models/user_specific/user_challenge_model.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? bio;
  final DateTime createdAt;
  final String profilePictureUrl;
  final int signUpSeconds;
  final List<GoalModel> goals;
  final List<UserBadgeModel> badges;
  final Map<String, UserChallengeModel> challenges;
  final List<Post> posts;

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
    Map<String, UserChallengeModel>? challenges,
    List<Post>? posts,
  })  : goals = goals ?? <GoalModel>[],
        badges = badges ?? <UserBadgeModel>[],
        challenges = challenges ?? <String, UserChallengeModel>{},
        posts = posts ?? <Post>[];

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
      goals: entity.goals.map((Goal g) => GoalModel.fromEntity(g)).toList(),
      badges: entity.badges.map((UserBadge b) => UserBadgeModel.fromEntity(b)).toList(),
      challenges: Map.fromEntries(entity.challenges
          .map((UserChallenge c) => MapEntry(c.challengeId, UserChallengeModel.fromEntity(c)))),
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
      goals: goals.map((GoalModel g) => g.toEntity()).toList(),
      badges: badges.map((UserBadgeModel b) => b.toEntity()).toList(),
      challenges: challenges.values.map((UserChallengeModel c) => c.toEntity()).toList(),
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
      goals: (json['goals'] as List?)?.map((g) => GoalModel.fromJson(g)).toList() ?? <GoalModel>[],
      badges: (json['badges'] as List?)?.map((b) => UserBadgeModel.fromJson(b)).toList() ??
          <UserBadgeModel>[],
      challenges: (json['challenges'] as Map<String, dynamic>?)?.map(
              (String key, dynamic value) => MapEntry(key, UserChallengeModel.fromJson(value))) ??
          <String, UserChallengeModel>{},
      posts: List<Post>.from(json['posts'] ?? <Post>[]),
    );
  }

  // Convert UserModel to a map
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'bio': bio,
      'createdAt': createdAt.toIso8601String(),
      'profilePictureUrl': profilePictureUrl,
      'signUpSeconds': signUpSeconds,
      'goals': goals.map((GoalModel g) => g.toJson()).toList(),
      'badges': badges.map((UserBadgeModel b) => b.toJson()).toList(),
      'challenges':
          challenges.map((String key, UserChallengeModel value) => MapEntry(key, value.toJson())),
      'posts': posts,
    };
  }
}
