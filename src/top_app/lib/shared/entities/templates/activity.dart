import 'package:equatable/equatable.dart';
import 'package:top_app/core/theme/app_icon.dart';
import 'proof.dart';

class Activity extends Equatable {
  final String name;
  final int streakEdge;
  final AppIcon icon;
  final List<int> daysOfWeek;
  final List<Proof> proof;

  const Activity({
    required this.name,
    required this.streakEdge,
    required this.icon,
    required this.daysOfWeek,
    required this.proof,
  });

  Activity copyWith({
    String? name,
    int? streakEdge,
    AppIcon? icon,
    List<int>? daysOfWeek,
    List<Proof>? proof,
  }) {
    return Activity(
      name: name ?? this.name,
      streakEdge: streakEdge ?? this.streakEdge,
      icon: icon ?? this.icon,
      daysOfWeek: daysOfWeek ?? this.daysOfWeek,
      proof: proof ?? this.proof,
    );
  }

  @override
  List<Object?> get props => [name, streakEdge, icon, daysOfWeek, proof];
}
