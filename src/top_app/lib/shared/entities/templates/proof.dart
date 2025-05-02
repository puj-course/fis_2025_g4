import 'package:equatable/equatable.dart';
import 'package:top_app/core/theme/app_icon.dart';

enum ProofType {
  text('text'),
  image('image'),
  textAndImage('text-and-image');

  final String name;
  const ProofType(this.name);
}

class Proof extends Equatable {
  final String id;
  final String name;
  final ProofType type;
  final AppIcon icon;

  const Proof({
    required this.id,
    required this.name,
    required this.type,
    required this.icon,
  });

  Proof copyWith({
    String? id,
    String? name,
    ProofType? type,
    AppIcon? icon,
  }) {
    return Proof(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      icon: icon ?? this.icon,
    );
  }

  @override
  List<Object?> get props => <Object?>[id, name, type, icon];
}
