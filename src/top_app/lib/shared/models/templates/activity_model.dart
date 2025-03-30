import 'package:top_app/core/theme/app_icon.dart';

import '../../entities/templates/activity.dart';
import 'proof_model.dart';

class ActivityModel {
  final String name;
  final int streakEdge;
  final AppIcon icon;
  final List<int> daysOfWeek;
  final List<ProofModel> proof;

  ActivityModel({
    required this.name,
    required this.streakEdge,
    required this.icon,
    required this.daysOfWeek,
    required this.proof,
  });

  factory ActivityModel.fromEntity(Activity entity) {
    return ActivityModel(
      name: entity.name,
      streakEdge: entity.streakEdge,
      icon: entity.icon,
      daysOfWeek: entity.daysOfWeek,
      proof: entity.proof.map((p) => ProofModel.fromEntity(p)).toList(),
    );
  }

  Activity toEntity() {
    return Activity(
      name: name,
      streakEdge: streakEdge,
      icon: icon,
      daysOfWeek: daysOfWeek,
      proof: proof.map((p) => p.toEntity()).toList(),
    );
  }

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      name: json['name'],
      streakEdge: json['streakEdge'] as int,
      icon: AppIcon.fromCode(json['iconCode']),
      daysOfWeek: List<int>.from(json['daysOfWeek'].map((e) => e as int)),
      proof: (json['proof'] as List).map((p) => ProofModel.fromJson(p)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'streakEdge': streakEdge,
      'iconCode': icon.iconCode,
      'daysOfWeek': daysOfWeek,
      'proof': proof.map((p) => p.toJson()).toList(),
    };
  }
}
