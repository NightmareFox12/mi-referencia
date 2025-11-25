import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/domain/reference_provider.dart';
import 'package:mi_referencia/utils/format_amount.dart';

class LastWeekLineChart extends HookConsumerWidget {
  static final List<String> weekDays = [
    "Lun",
    "Mar",
    "Mie",
    "Jue",
    "Vie",
    "Sab",
    "Dom",
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //watchs
    final lastWeek = ref.watch(lastReferencesWeekProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
        width: .maxFinite,
        height: 250,
        child: Card.filled(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: lastWeek.when(
              data: (references) {
                final spots = references.asMap().entries.map((entry) {
                  final index = entry.key;
                  final reference = entry.value;
                  final roundedAmount = reference.amount.roundToDouble();
                  return FlSpot(index.toDouble(), roundedAmount);
                }).toList();
                if (spots.isEmpty)
                  return const Center(
                    child: Text(
                      'No hay datos para mostrar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );

                return LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt();
                            if (index >= 0 && index < weekDays.length) {
                              return Text(weekDays[index]);
                            }
                            return const Text('');
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                        getTooltipItems: (touchedSpots) => touchedSpots
                            .map(
                              (spot) => LineTooltipItem(
                                "${formatAmount(spot.y)} Bs.F",
                                const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        barWidth: 4,
                        gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.green],
                        ),
                        spots: spots,
                      ),
                    ],
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          ),
        ),
      ),
    );
  }
}
