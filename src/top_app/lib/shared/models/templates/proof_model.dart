import 'package:top_app/core/theme/app_icon.dart';

import '../../entities/templates/proof.dart';

class ProofModel {
  final String name;
  final String type;
  final AppIcon icon;

  ProofModel({
    required this.name,
    required this.type,
    required this.icon,
  });

  factory ProofModel.fromEntity(Proof entity) {
    return ProofModel(
      name: entity.name,
      type: entity.type,
      icon: entity.icon,
    );
  }

  Proof toEntity() {
    return Proof(
      name: name,
      type: type,
      icon: icon,
    );
  }

  factory ProofModel.fromJson(Map<String, dynamic> json) {
    return ProofModel(
      name: json['name'],
      type: json['type'],
      icon: AppIcon.fromCode(json['iconCode']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'iconCode': icon.iconCode,
    };
  }
}
