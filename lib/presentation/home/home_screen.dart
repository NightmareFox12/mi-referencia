import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/presentation/configuration/configuration_screen.dart';
import 'package:mi_referencia/presentation/history/history_screen.dart';
import 'package:mi_referencia/presentation/widgets/bottom_bar_widget.dart';
import 'package:mi_referencia/presentation/widgets/fab_menu.dart';
import 'package:mi_referencia/presentation/widgets/last_references.dart';
import 'package:mi_referencia/presentation/widgets/last_week_line_chart.dart';
import 'package:mi_referencia/presentation/widgets/total_amount_label.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //states
    final currentScreen = useState<int>(0);

    return Scaffold(
      appBar: AppBar(title: Text('Mi Referencia')),
      bottomNavigationBar: BottomBarWidget(currentScreen: currentScreen),

      body: Stack(
        alignment: .bottomRight,
        children: [
          currentScreen.value == 0
              ? Column(
                  children: [
                    TotalAmountLabel(),
                    LastWeekLineChart(),
                    LastReferences(currentScreen: currentScreen),
                  ],
                )
              : (currentScreen.value == 1)
              ? HistoryScreen()
              : ConfigurationScreen(),

          FabMenu(currentScreen: currentScreen.value),
        ],
      ),
    );
  }
}
