import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mi_referencia/presentation/history/history_screen.dart';
import 'package:mi_referencia/presentation/widgets/bottom_bar_widget.dart';
import 'package:mi_referencia/presentation/widgets/fab_menu.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //states
    final currentScreen = useState<int>(0);

    return Scaffold(
      appBar: AppBar(title: Text('Mi Referencia')),
      bottomNavigationBar: BottomBarWidget(currentScreen: currentScreen),

      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          if (currentScreen.value == 0)
            Stack(
              children: [
                // 1. El Gráfico (Tu Círculo)
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 250,
                    height: 250,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            color: Colors.red,
                            value: 100,
                            radius: 12,
                            showTitle: false,
                          ),
                        ],
                      ),
                      duration: Duration(milliseconds: 150),
                      curve: Curves.linear,
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '100%',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          else
            Center(
              child: Column(
                children: [
                  IconButton.filled(
                    onPressed: () {},
                    icon: Icon(Icons.agriculture_rounded),
                  ),
                ],
              ),
            ),
          FabMenu(currentScreen: currentScreen.value),
        ],
      ),
    );
  }
}

// ElevatedButton(
//   child: const Text('Show Snackbar'),
//   onPressed: () {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: const Text('Awesome Snackbar!'),
//         action: SnackBarAction(
//           label: 'Action',
//           onPressed: () {
//             // Code to execute.
//           },
//         ),
//       ),
//     );
//   },
// ),
