import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  final currentScreen;

  BottomBarWidget({super.key, required ValueNotifier<int> this.currentScreen});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
