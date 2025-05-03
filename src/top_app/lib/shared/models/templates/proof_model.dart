import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_icon.dart';
import '../../entities/templates/proof.dart';

class ProofModel {
  final String id;
  final String name;
  final ProofType type;
  final bool timeBased;
  final AppIcon icon;
  final TimeOfDay? proofStartTime;
  final TimeOfDay? proofEndTime;

  ProofModel({
    required this.id,
    required this.name,
    required this.type,
    required this.timeBased,
    required this.icon,
    this.proofStartTime,
    this.proofEndTime,
  });

  factory ProofModel.fromEntity(Proof entity) {
    return ProofModel(
      id: entity.id,
      name: entity.name,
      type: entity.type,
      timeBased: entity.timeBased,
      icon: entity.icon,
      proofStartTime: entity.proofStartTime,
      proofEndTime: entity.proofEndTime,
    );
  }

  Proof toEntity() {
    return Proof(
      id: id,
      name: name,
      type: type,
      icon: icon,
      timeBased: timeBased,
      proofStartTime: proofStartTime,
      proofEndTime: proofEndTime,
    );
  }

  factory ProofModel.fromJson(Map<String, dynamic> json) {
    final String typeName = json['type'] as String;
    return ProofModel(
      id: json['id'],
      name: json['name'],
      type: ProofType.values.firstWhere(
        (ProofType e) => e.name == typeName,
        orElse: () => throw Exception('Invalid proof type: $typeName'),
      ),
      icon: AppIcon.fromCode(json['iconCode']),
      timeBased: json['timeBased'] ?? false,
      proofStartTime: _parseTimeString(json['proofStartTime']),
      proofEndTime: _parseTimeString(json['proofEndTime']),
    );
  }

  static TimeOfDay? _parseTimeString(String? timeStr) {
    if (timeStr == null) return null;
    try {
      final List<String> parts = timeStr.split(':');
      if (parts.length != 2) return null;

      final int hour = int.parse(parts[0]);
      final int minute = int.parse(parts[1]);

      if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
        return null;
      }

      return TimeOfDay(hour: hour, minute: minute);
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type.name,
      'timeBased': timeBased,
      'iconCode': icon.iconCode,
    };
  }
}
