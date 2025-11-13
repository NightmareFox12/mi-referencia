import 'package:intl/intl.dart';

String formatAmount(double amount) {
  final formatter = NumberFormat('#,##0.00', 'es_ES');
  return formatter.format(amount / 100);
}
