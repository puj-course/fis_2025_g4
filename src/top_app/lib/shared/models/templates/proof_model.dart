import 'package:top_app/core/theme/app_icon.dart';
import '../../entities/templates/proof.dart';

class ProofModel {
  final String name;
  final ProofType type;
  final bool timeBased;
  final AppIcon icon;

  ProofModel({
    required this.name,
    required this.type,
    required this.timeBased,
    required this.icon,
  });

  factory ProofModel.fromEntity(Proof entity) {
    return ProofModel(
      name: entity.name,
      type: entity.type,
      timeBased: false, // Default value since entity doesn't have timeBased
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
    final String typeName = json['type'] as String;
    return ProofModel(
      name: json['name'],
      type: ProofType.values.firstWhere(
        (ProofType e) => e.name == typeName,
        orElse: () => throw Exception('Invalid proof type: $typeName'),
      ),
      timeBased: json['timeBased'] ?? false,
      icon: AppIcon.fromCode(json['iconCode']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'type': type.name,
      'timeBased': timeBased,
      'iconCode': icon.iconCode,
    };
  }
}
