import 'package:equatable/equatable.dart';

class ProofType extends Equatable {
  final String name;
  final bool timeBased;

  const ProofType({
    required this.name,
    required this.timeBased,
  });

  @override
  List<Object?> get props => <Object?>[name, timeBased];
}
