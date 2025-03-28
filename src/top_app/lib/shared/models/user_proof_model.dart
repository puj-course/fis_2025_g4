import '../entities/user_proof.dart';

class UserProofModel {
  final String proofName;
  final String type;
  final String? submittedText;
  final String? submittedPictureUrl;
  final DateTime submittedAt;
  final bool isValid;

  UserProofModel({
    required this.proofName,
    required this.type,
    this.submittedText,
    this.submittedPictureUrl,
    required this.submittedAt,
    required this.isValid,
  });

  factory UserProofModel.fromEntity(UserProof entity) {
    return UserProofModel(
      proofName: entity.proofName,
      type: entity.type,
      submittedText: entity.submittedText,
      submittedPictureUrl: entity.submittedPictureUrl,
      submittedAt: entity.submittedAt,
      isValid: entity.isValid,
    );
  }

  UserProof toEntity() {
    return UserProof(
      proofName: proofName,
      type: type,
      submittedText: submittedText,
      submittedPictureUrl: submittedPictureUrl,
      submittedAt: submittedAt,
      isValid: isValid,
    );
  }

  factory UserProofModel.fromJson(Map<String, dynamic> json) {
    return UserProofModel(
      proofName: json['proofName'],
      type: json['type'],
      submittedText: json['submittedText'],
      submittedPictureUrl: json['submittedPictureUrl'],
      submittedAt: DateTime.parse(json['submittedAt']),
      isValid: json['isValid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'proofName': proofName,
      'type': type,
      'submittedText': submittedText,
      'submittedPictureUrl': submittedPictureUrl,
      'submittedAt': submittedAt.toIso8601String(),
      'isValid': isValid,
    };
  }
}
