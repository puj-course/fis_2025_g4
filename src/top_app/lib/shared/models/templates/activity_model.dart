import 'package:top_app/core/theme/app_icon.dart';
import 'package:top_app/shared/entities/templates/proof.dart';

import '../../entities/templates/activity.dart';
import 'proof_model.dart';

class ActivityModel {
  final String id;
  final String name;
  final int streakEdge;
  final AppIcon icon;
  final List<int> daysOfWeek;
  final List<ProofModel> proof;
  final String challengeId;

  ActivityModel({
    required this.id,
    required this.name,
    required this.streakEdge,
    required this.icon,
    required this.daysOfWeek,
    required this.proof,
    required this.challengeId,
  });

  factory ActivityModel.fromEntity(Activity entity) {
    return ActivityModel(
      id: entity.id,
      name: entity.name,
      streakEdge: entity.streakEdge,
      icon: entity.icon,
      daysOfWeek: entity.daysOfWeek,
      proof: entity.proof.map((Proof p) => ProofModel.fromEntity(p)).toList(),
      challengeId: entity.challengeId,
    );
  }

  Activity toEntity() {
    return Activity(
      id: id,
      name: name,
      streakEdge: streakEdge,
      icon: icon,
      daysOfWeek: daysOfWeek,
      proof: proof.map((ProofModel p) => p.toEntity()).toList(),
      challengeId: challengeId,
    );
  }

  factory ActivityModel.fromJson(Map<String, dynamic> json, String challengeId) {
    return ActivityModel(
      id: json['id'],
      name: json['name'],
      streakEdge: json['streakEdge'] as int,
      icon: AppIcon.fromCode(json['iconCode']),
      daysOfWeek: List<int>.from(json['daysOfWeek'].map((e) => e as int)),
      proof: (json['proof'] as List).map((p) => ProofModel.fromJson(p)).toList(),
      challengeId: challengeId,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'streakEdge': streakEdge,
      'iconCode': icon.iconCode,
      'daysOfWeek': daysOfWeek,
      'proof': proof.map((ProofModel p) => p.toJson()).toList(),
    };
  }
}
