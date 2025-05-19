import 'package:equatable/equatable.dart';

class Goal extends Equatable {
  final String id;
  final String name;
  final DateTime createdAt;
  final String type;
  final DateTime dueDate;
  final double completion;

  const Goal({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.type,
    required this.dueDate,
    required this.completion,
  });

  Goal copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
    String? type,
    DateTime? dueDate,
    double? completion,
  }) {
    return Goal(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
      dueDate: dueDate ?? this.dueDate,
      completion: completion ?? this.completion,
    );
  }

  @override
  List<Object?> get props => <Object?>[id, name, createdAt, type, dueDate, completion];
}
