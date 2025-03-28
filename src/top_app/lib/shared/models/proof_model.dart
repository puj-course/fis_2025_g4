import '../entities/proof.dart';

class ProofModel {
  final String name;
  final String type;
  final String iconCode;

  ProofModel({
    required this.name,
    required this.type,
    required this.iconCode,
  });

  factory ProofModel.fromEntity(Proof entity) {
    return ProofModel(
      name: entity.name,
      type: entity.type,
      iconCode: entity.iconCode,
    );
  }

  Proof toEntity() {
    return Proof(
      name: name,
      type: type,
      iconCode: iconCode,
    );
  }

  factory ProofModel.fromJson(Map<String, dynamic> json) {
    return ProofModel(
      name: json['name'],
      type: json['type'],
      iconCode: json['iconCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'iconCode': iconCode,
    };
  }
}
