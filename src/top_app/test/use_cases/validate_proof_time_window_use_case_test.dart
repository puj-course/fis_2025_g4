import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:top_app/modules/submit_activity_proof/domain/use_cases/validate_proof_time_window_use_case.dart';

void main() {
  final ValidateProofTimeWindowUseCase useCase = ValidateProofTimeWindowUseCase();

  test('dentro del rango', () {
    final bool result = useCase.call(
      now: const TimeOfDay(hour: 3, minute: 35),
      start: const TimeOfDay(hour: 3, minute: 30),
      end: const TimeOfDay(hour: 3, minute: 40),
    );
    expect(result, isTrue);
  });

  test('fuera del rango (antes)', () {
    final bool result = useCase.call(
      now: const TimeOfDay(hour: 3, minute: 25),
      start: const TimeOfDay(hour: 3, minute: 30),
      end: const TimeOfDay(hour: 3, minute: 40),
    );
    expect(result, isFalse);
  });
}
