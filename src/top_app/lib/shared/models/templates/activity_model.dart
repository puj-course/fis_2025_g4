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
  final Map<String, ProofModel> proof;
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
      proof: Map.fromEntries(
        entity.proof.map((Proof p) => MapEntry<String, ProofModel>(p.id, ProofModel.fromEntity(p))),
      ),
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
      proof: proof.values.map((ProofModel p) => p.toEntity()).toList(),
      challengeId: challengeId,
    );
  }

  factory ActivityModel.fromJson(Map<String, dynamic> json, String challengeId) {
    final Map<String, dynamic> proofMap = json['proof'] as Map<String, dynamic>;
    return ActivityModel(
      id: json['id'],
      name: json['name'],
      streakEdge: json['streakEdge'] as int,
      icon: AppIcon.fromCode(json['iconCode']),
      daysOfWeek: List<int>.from(json['daysOfWeek'].map((dynamic e) => e as int)),
      proof: Map<String, ProofModel>.fromEntries(
        proofMap.entries.map((MapEntry<String, dynamic> e) =>
            MapEntry<String, ProofModel>(e.key, ProofModel.fromJson(e.value))),
      ),
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
      'proof': Map<String, dynamic>.fromEntries(
        proof.entries.map(
            (MapEntry<String, ProofModel> e) => MapEntry<String, dynamic>(e.key, e.value.toJson())),
      ),
    };
  }
}
