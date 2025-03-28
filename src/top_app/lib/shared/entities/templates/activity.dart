import 'package:equatable/equatable.dart';
import 'proof.dart';

class Activity extends Equatable {
  final String name;
  final int streakEdge;
  final String iconCode;
  final List<int> daysOfWeek;
  final List<Proof> proof;

  const Activity({
    required this.name,
    required this.streakEdge,
    required this.iconCode,
    required this.daysOfWeek,
    required this.proof,
  });

  Activity copyWith({
    String? name,
    int? streakEdge,
    String? iconCode,
    List<int>? daysOfWeek,
    List<Proof>? proof,
  }) {
    return Activity(
      name: name ?? this.name,
      streakEdge: streakEdge ?? this.streakEdge,
      iconCode: iconCode ?? this.iconCode,
      daysOfWeek: daysOfWeek ?? this.daysOfWeek,
      proof: proof ?? this.proof,
    );
  }

  @override
  List<Object?> get props => [name, streakEdge, iconCode, daysOfWeek, proof];
}
