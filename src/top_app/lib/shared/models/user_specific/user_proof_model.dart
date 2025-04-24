import '../../entities/user_specific/user_proof.dart';

class UserProofModel {
  final String type;
  final String? submittedText;
  final List<String> submittedImageUrls;
  final DateTime submittedAt;
  final bool isValid;

  UserProofModel({
    required this.type,
    this.submittedText,
    required this.submittedImageUrls,
    required this.submittedAt,
    required this.isValid,
  });

  factory UserProofModel.fromEntity(UserProof entity) {
    return UserProofModel(
      type: entity.type,
      submittedText: entity.submittedText,
      submittedImageUrls: entity.submittedImageUrls,
      submittedAt: entity.submittedAt,
      isValid: entity.isValid,
    );
  }

  UserProof toEntity() {
    return UserProof(
      type: type,
      submittedText: submittedText,
      submittedImageUrls: submittedImageUrls,
      submittedAt: submittedAt,
      isValid: isValid,
    );
  }

  factory UserProofModel.fromJson(Map<String, dynamic> json) {
    return UserProofModel(
      type: json['type'],
      submittedText: json['submittedText'],
      submittedImageUrls: List<String>.from(json['submittedImageUrls']),
      submittedAt: DateTime.parse(json['submittedAt']),
      isValid: json['isValid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'submittedText': submittedText,
      'submittedImageUrls': submittedImageUrls,
      'submittedAt': submittedAt.toIso8601String(),
      'isValid': isValid,
    };
  }
}
