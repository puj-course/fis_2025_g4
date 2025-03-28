import 'package:equatable/equatable.dart';
import '../../../../entities/templates/goal.dart';
import '../../../../entities/templates/badge.dart';
import '../../../../entities/templates/challenge.dart';

class UserEntity extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String bio;
  final DateTime createdAt;
  final String profilePictureUrl;
  final int signUpSeconds;
  final List<Goal> goals;
  final List<Badge> badges;
  final List<Challenge> challenges;
  final List<String> posts;

  UserEntity({
    required this.uid,
    required this.name,
    required this.email,
    required this.bio,
    required this.createdAt,
    required this.profilePictureUrl,
    required this.signUpSeconds,
    List<Goal>? goals,
    List<Badge>? badges,
    List<Challenge>? challenges,
    List<String>? posts,
  })  : goals = goals ?? [],
        badges = badges ?? [],
        challenges = challenges ?? [],
        posts = posts ?? [];

  UserEntity copyWith({
    String? uid,
    String? name,
    String? email,
    String? bio,
    DateTime? createdAt,
    String? profilePictureUrl,
    int? signUpSeconds,
    List<Goal>? goals,
    List<Badge>? badges,
    List<Challenge>? challenges,
    List<String>? posts,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      createdAt: createdAt ?? this.createdAt,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      signUpSeconds: signUpSeconds ?? this.signUpSeconds,
      goals: goals ?? this.goals,
      badges: badges ?? this.badges,
      challenges: challenges ?? this.challenges,
      posts: posts ?? this.posts,
    );
  }

  @override
  List<Object?> get props => [
        uid,
        name,
        email,
        bio,
        createdAt,
        profilePictureUrl,
        signUpSeconds,
        goals,
        badges,
        challenges,
        posts,
      ];
}
