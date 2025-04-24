import '../../entities/templates/proof_type.dart';

class ProofTypeModel {
  final String name;
  final bool timeBased;

  ProofTypeModel({
    required this.name,
    required this.timeBased,
  });

  factory ProofTypeModel.fromEntity(ProofType entity) {
    return ProofTypeModel(
      name: entity.name,
      timeBased: entity.timeBased,
    );
  }

  ProofType toEntity() {
    return ProofType(
      name: name,
      timeBased: timeBased,
    );
  }

  factory ProofTypeModel.fromJson(Map<String, dynamic> json) {
    return ProofTypeModel(
      name: json['type'],
      timeBased: json['timeBased'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'type': name,
      'timeBased': timeBased,
    };
  }
}
