class UserEntity {
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

  UserEntity({
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
}
