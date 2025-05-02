import 'package:equatable/equatable.dart';
import 'package:top_app/shared/entities/templates/proof.dart';

class UserProof extends Equatable {
  final String proofId;
  final ProofType type;
  final String? submittedText;
  final List<String> submittedImageUrls;
  final List<String> localImagePaths;
  final DateTime submittedAt;
  final bool isValid;

  const UserProof({
    required this.proofId,
    required this.type,
    this.submittedText,
    required this.submittedImageUrls,
    required this.localImagePaths,
    required this.submittedAt,
    required this.isValid,
  });

  UserProof copyWith({
    String? submittedText,
    List<String>? submittedImageUrls,
    List<String>? localImagePaths,
    DateTime? submittedAt,
    bool? isValid,
  }) {
    return UserProof(
      proofId: proofId,
      type: type,
      submittedText: submittedText ?? this.submittedText,
      submittedImageUrls: submittedImageUrls ?? this.submittedImageUrls,
      localImagePaths: localImagePaths ?? this.localImagePaths,
      submittedAt: submittedAt ?? this.submittedAt,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        proofId,
        type,
        submittedText,
        submittedImageUrls,
        localImagePaths,
        submittedAt,
        isValid,
      ];
}
