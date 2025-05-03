import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
  final bool timeBased;
  final TimeOfDay? proofStartTime;
  final TimeOfDay? proofEndTime;
  const Proof({
    required this.id,
    required this.name,
    required this.type,
    required this.icon,
    required this.timeBased,
    this.proofStartTime,
    this.proofEndTime,
  });

  Proof copyWith({
    String? id,
    String? name,
    ProofType? type,
    AppIcon? icon,
    bool? timeBased,
    TimeOfDay? proofStartTime,
    TimeOfDay? proofEndTime,
  }) {
    return Proof(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      icon: icon ?? this.icon,
      timeBased: timeBased ?? this.timeBased,
      proofStartTime: proofStartTime ?? this.proofStartTime,
      proofEndTime: proofEndTime ?? this.proofEndTime,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        type,
        icon,
        timeBased,
        proofStartTime,
        proofEndTime,
      ];
}
