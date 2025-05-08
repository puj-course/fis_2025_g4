import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:top_app/modules/submit_activity_proof/domain/use_cases/validate_proof_time_window_use_case.dart';

void main() {
  final ValidateProofTimeWindowUseCase usecase = ValidateProofTimeWindowUseCase();

  test('Prueba dentro del rango horario', () {
    final bool result = usecase.call(
      now: const TimeOfDay(hour: 3, minute: 35),
      start: const TimeOfDay(hour: 3, minute: 30),
      end: const TimeOfDay(hour: 3, minute: 40),
    );
    expect(result, isTrue);
  });

  test('Prueba fuera del rango horario (antes)', () {
    final bool result = usecase.call(
      now: const TimeOfDay(hour: 3, minute: 25),
      start: const TimeOfDay(hour: 3, minute: 30),
      end: const TimeOfDay(hour: 3, minute: 40),
    );
    expect(result, isFalse);
  });
}
