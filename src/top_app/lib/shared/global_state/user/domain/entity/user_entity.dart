import 'package:equatable/equatable.dart';
import 'package:top_app/shared/entities/templates/goal.dart';
import 'package:top_app/shared/entities/templates/post.dart';
import '../../../../entities/user_specific/user_badge.dart';
import '../../../../entities/user_specific/user_challenge.dart';

class UserEntity extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String? bio;
  final DateTime createdAt;
  final String? profilePictureUrl;
  final int signUpSeconds;
  final List<Goal> goals;
  final List<UserBadge> badges;
  final List<UserChallenge> challenges;
  final List<Post> posts;

  UserEntity({
    required this.uid,
    required this.name,
    required this.email,
    this.bio,
    required this.createdAt,
    this.profilePictureUrl,
    required this.signUpSeconds,
    List<Goal>? goals,
    List<UserBadge>? badges,
    List<UserChallenge>? challenges,
    List<Post>? posts,
  })  : goals = goals ?? <Goal>[],
        badges = badges ?? <UserBadge>[],
        challenges = challenges ?? <UserChallenge>[],
        posts = posts ?? <Post>[];

  UserEntity copyWith({
    String? uid,
    String? name,
    String? email,
    String? bio,
    DateTime? createdAt,
    String? profilePictureUrl,
    int? signUpSeconds,
    List<Goal>? goals,
    List<UserBadge>? badges,
    List<UserChallenge>? challenges,
    List<Post>? posts,
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
  List<Object?> get props => <Object?>[
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
