import 'package:equatable/equatable.dart';
import 'package:top_app/shared/entities/templates/proof.dart';

class UserProof extends Equatable {
  final ProofType type;
  final String? submittedText;
  final List<String> submittedImageUrls;
  final DateTime submittedAt;
  final bool isValid;

  const UserProof({
    required this.type,
    this.submittedText,
    required this.submittedImageUrls,
    required this.submittedAt,
    required this.isValid,
  });

  UserProof copyWith({
    String? submittedText,
    List<String>? submittedImageUrls,
    DateTime? submittedAt,
    bool? isValid,
  }) {
    return UserProof(
      type: type,
      submittedText: submittedText ?? this.submittedText,
      submittedImageUrls: submittedImageUrls ?? this.submittedImageUrls,
      submittedAt: submittedAt ?? this.submittedAt,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        type,
        submittedText,
        submittedImageUrls,
        submittedAt,
        isValid,
      ];
}
