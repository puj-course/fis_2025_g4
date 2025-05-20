import '../../entities/templates/goal.dart';

class GoalModel {
  final String id;
  final String name;
  final DateTime createdAt;
  final String type;
  final DateTime dueDate;
  final double completion;

  GoalModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.type,
    required this.dueDate,
    required this.completion,
  });

  factory GoalModel.fromEntity(Goal entity) {
    return GoalModel(
      id: entity.id,
      name: entity.name,
      createdAt: entity.createdAt,
      type: entity.type,
      dueDate: entity.dueDate,
      completion: entity.completion,
    );
  }

  Goal toEntity() {
    return Goal(
      id: id,
      name: name,
      createdAt: createdAt,
      type: type,
      dueDate: dueDate,
      completion: completion,
    );
  }

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    return GoalModel(
      id: json['uid'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']),
      type: json['type'],
      dueDate: DateTime.parse(json['dueDate']),
      completion: json['completion'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': id,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'type': type, // progressive or instant
      'dueDate': dueDate.toIso8601String(),
      'completion': completion,
    };
  }
}
