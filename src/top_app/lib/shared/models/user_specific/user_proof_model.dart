import 'package:top_app/shared/entities/templates/proof.dart';

import '../../entities/user_specific/user_proof.dart';

class UserProofModel {
  final String proofId;
  final ProofType type;
  final String? submittedText;
  final List<String> submittedImageUrls;
  final DateTime submittedAt;
  final bool isValid;

  UserProofModel({
    required this.proofId,
    required this.type,
    this.submittedText,
    required this.submittedImageUrls,
    required this.submittedAt,
    required this.isValid,
  });

  factory UserProofModel.fromEntity(UserProof entity) {
    return UserProofModel(
      proofId: entity.proofId,
      type: entity.type,
      submittedText: entity.submittedText,
      submittedImageUrls: entity.submittedImageUrls,
      submittedAt: entity.submittedAt,
      isValid: entity.isValid,
    );
  }

  UserProof toEntity() {
    return UserProof(
      proofId: proofId,
      type: type,
      submittedText: submittedText,
      submittedImageUrls: submittedImageUrls,
      localImagePaths: <String>[],
      submittedAt: submittedAt,
      isValid: isValid,
    );
  }

  factory UserProofModel.fromJson(Map<String, dynamic> json) {
    return UserProofModel(
      proofId: json['proofId'],
      type: ProofType.values.firstWhere(
        (ProofType e) => e.name == json['type'],
        orElse: () => throw Exception('Invalid proof type: ${json['type']}'),
      ),
      submittedText: json['submittedText'],
      submittedImageUrls: List<String>.from(json['submittedImageUrls']),
      submittedAt: DateTime.parse(json['submittedAt']),
      isValid: json['isValid'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'proofId': proofId,
      'type': type.name,
      'submittedText': submittedText,
      'submittedImageUrls': submittedImageUrls,
      'submittedAt': submittedAt.toIso8601String(),
      'isValid': isValid,
    };
  }
}
