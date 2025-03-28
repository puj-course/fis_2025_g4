import 'package:equatable/equatable.dart';

class UserProof extends Equatable {
  final String proofName;
  final String type;
  final String? submittedText;
  final String? submittedPictureUrl;
  final DateTime submittedAt;
  final bool isValid;

  const UserProof({
    required this.proofName,
    required this.type,
    this.submittedText,
    this.submittedPictureUrl,
    required this.submittedAt,
    required this.isValid,
  });

  UserProof copyWith({
    String? proofName,
    String? type,
    String? submittedText,
    String? submittedPictureUrl,
    DateTime? submittedAt,
    bool? isValid,
  }) {
    return UserProof(
      proofName: proofName ?? this.proofName,
      type: type ?? this.type,
      submittedText: submittedText ?? this.submittedText,
      submittedPictureUrl: submittedPictureUrl ?? this.submittedPictureUrl,
      submittedAt: submittedAt ?? this.submittedAt,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        proofName,
        type,
        submittedText,
        submittedPictureUrl,
        submittedAt,
        isValid,
      ];
}
