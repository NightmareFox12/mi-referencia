import 'package:intl/intl.dart';

/**
 * 
 * @param amount eg. 123456
 * @return String (ej. 1.234,56).
 */
String formatAmount(double amount) {
  final formatter = NumberFormat('#,##0.00', 'es_ES');
  return formatter.format(amount / 100);
}

/**
 * 
 * @param formattedAmount eg. 1.234,56
 * @return double (eg. 123456).
 */
double parseAmount(String formattedAmount) {
  if (formattedAmount.isEmpty) return 0.0;

  String cleaned = formattedAmount.replaceAll('.', '');

  cleaned = cleaned.replaceAll(',', '.');
  final amountInUnits = double.tryParse(cleaned) ?? 0.0;

  return amountInUnits * 100;
}
