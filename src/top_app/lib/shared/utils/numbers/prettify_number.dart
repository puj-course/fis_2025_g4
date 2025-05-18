import 'package:intl/intl.dart';

String prettifyNumber(int number) {
  if (number < 1000) {
    return number.toString();
  }

  final double value = number.toDouble();
  String suffix = '';
  double divisor = 1.0;

  if (number >= 1000000000) {
    suffix = 'B';
    divisor = 1000000000.0;
  } else if (number >= 1000000) {
    suffix = 'M';
    divisor = 1000000.0;
  } else if (number >= 1000) {
    suffix = 'k';
    divisor = 1000.0;
  }

  final double formattedNumber = value / divisor;
  final NumberFormat formatter = NumberFormat('#.#', 'en_US');
  return '${formatter.format(formattedNumber)}$suffix';
}
