import 'package:equatable/equatable.dart';

class UserProof extends Equatable {
  final String type; // e.g. "text", "image", "text+image", "time-based"
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

  @override
  List<Object?> get props => <Object?>[
        type,
        submittedText,
        submittedImageUrls,
        submittedAt,
        isValid,
      ];
}
