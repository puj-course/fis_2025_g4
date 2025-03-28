import 'package:equatable/equatable.dart';

class Proof extends Equatable {
  final String name;
  final String type;
  final String iconCode;

  const Proof({
    required this.name,
    required this.type,
    required this.iconCode,
  });

  Proof copyWith({
    String? name,
    String? type,
    String? iconCode,
  }) {
    return Proof(
      name: name ?? this.name,
      type: type ?? this.type,
      iconCode: iconCode ?? this.iconCode,
    );
  }

  @override
  List<Object?> get props => [name, type, iconCode];
}
