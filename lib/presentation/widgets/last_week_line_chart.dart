import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
        width: double.maxFinite,
        height: 250,
        child: Card.filled(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) =>
                          Text(weekDays[value.toInt()]),
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
                            const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                        .toList(),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    barWidth: 4,
                    gradient: LinearGradient(colors: [Colors.blue, Colors.red]),
                    spots: [
                      const FlSpot(0, 0),
                      const FlSpot(1, 500),
                      const FlSpot(2, 1000),
                      const FlSpot(3, 1500),
                      const FlSpot(4, 2000),
                      const FlSpot(5, 2500),
                      const FlSpot(6, 100),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
