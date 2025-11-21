import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mi_referencia/presentation/history/history_screen.dart';
import 'package:mi_referencia/presentation/widgets/animate_pie.dart';
import 'package:mi_referencia/presentation/widgets/bottom_bar_widget.dart';
import 'package:mi_referencia/presentation/widgets/fab_menu.dart';

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
          currentScreen.value == 0
              ? AnimatePie(currentScreen: currentScreen)
              : (currentScreen.value == 1)
              ? HistoryScreen()
              : Center(
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
