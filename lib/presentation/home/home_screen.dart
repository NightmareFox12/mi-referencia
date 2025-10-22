import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mi_referencia/presentation/history/history_screen.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //states
    final currentScreen = useState<int>(0);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Mi Referencia')),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentScreen.value,
          onTap: (value) {
            currentScreen.value = value;
          },
          items: [
            BottomNavigationBarItem(label: 'Inicio', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_sharp),
              label: 'Graficas',
            ),
          ],
        ),
        floatingActionButton: currentScreen.value == 0
            ? FloatingActionButton(onPressed: () {}, child: Icon(Icons.create))
            : SizedBox.shrink(),
        body: SafeArea(
          child: currentScreen.value == 0 ? HistoryScreen() : Text('ma'),
        ),
      ),
    );
  }
}
