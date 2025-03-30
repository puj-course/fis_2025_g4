import 'package:equatable/equatable.dart';
import 'package:top_app/core/theme/app_icon.dart';

class Proof extends Equatable {
  final String name;
  final String type;
  final AppIcon icon;

  const Proof({
    required this.name,
    required this.type,
    required this.icon,
  });

  Proof copyWith({
    String? name,
    String? type,
    AppIcon? icon,
  }) {
    return Proof(
      name: name ?? this.name,
      type: type ?? this.type,
      icon: icon ?? this.icon,
    );
  }

  @override
  List<Object?> get props => [name, type, icon];
}
