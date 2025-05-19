import 'package:equatable/equatable.dart';

class Badge extends Equatable {
  final String iconUrl;
  final String name;
  final String challengeId;

  const Badge({
    required this.iconUrl,
    required this.name,
    required this.challengeId,
  });

  Badge copyWith({
    String? iconUrl,
    String? name,
    String? challengeId,
  }) {
    return Badge(
      iconUrl: iconUrl ?? this.iconUrl,
      name: name ?? this.name,
      challengeId: challengeId ?? this.challengeId,
    );
  }

  @override
  List<Object?> get props => <Object?>[iconUrl, name, challengeId];
}
