import 'package:top_app/core/theme/app_icon.dart';
import '../../entities/templates/proof.dart';
import 'proof_type_model.dart';

class ProofModel {
  final String name;
  final ProofTypeModel type;
  final AppIcon icon;

  ProofModel({
    required this.name,
    required this.type,
    required this.icon,
  });

  factory ProofModel.fromEntity(Proof entity) {
    return ProofModel(
      name: entity.name,
      type: ProofTypeModel.fromEntity(entity.type),
      icon: entity.icon,
    );
  }

  Proof toEntity() {
    return Proof(
      name: name,
      type: type.toEntity(),
      icon: icon,
    );
  }

  factory ProofModel.fromJson(Map<String, dynamic> json) {
    return ProofModel(
      name: json['name'],
      type: ProofTypeModel.fromJson(json),
      icon: AppIcon.fromCode(json['iconCode']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type.name,
      'timeBased': type.timeBased,
      'iconCode': icon.iconCode,
    };
  }
}
