import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mi_referencia/presentation/history/history_screen.dart';
import 'package:mi_referencia/presentation/widgets/fab_menu.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //states
    final currentScreen = useState<int>(0);

    return Scaffold(
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

      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ElevatedButton(
            child: const Text('Show Snackbar'),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Awesome Snackbar!'),
                  action: SnackBarAction(
                    label: 'Action',
                    onPressed: () {
                      // Code to execute.
                    },
                  ),
                ),
              );
            },
          ),

          currentScreen.value == 0
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
