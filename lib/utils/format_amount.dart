import 'package:intl/intl.dart';

String formatAmount(double amount) {
  final formatter = NumberFormat('#,##0.00', 'es_ES');
  return formatter.format(amount / 100);
}

double parseAmount(String formattedAmount) {
  if (formattedAmount.isEmpty) return 0.0;

  String cleaned = formattedAmount.replaceAll('.', '');

  cleaned = cleaned.replaceAll(',', '.');
  final amountInUnits = double.tryParse(cleaned) ?? 0.0;

  return amountInUnits * 100;
}
