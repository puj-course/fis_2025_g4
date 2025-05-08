// validate_proof_time_window_use_case.dart
import 'package:flutter/material.dart';

class ValidateProofTimeWindowUseCase {
  bool call({
    required TimeOfDay now,
    required TimeOfDay start,
    required TimeOfDay end,
  }) {
    return now.isAfter(start) && now.isBefore(end);
  }
}
