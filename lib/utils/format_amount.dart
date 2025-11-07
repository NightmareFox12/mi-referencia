import 'package:intl/intl.dart';

String formatAmount(double amount) {
  final formatter = NumberFormat('#,##0.0', 'es_VE');
  final formatted = formatter.format(amount);
  return formatted;
}
