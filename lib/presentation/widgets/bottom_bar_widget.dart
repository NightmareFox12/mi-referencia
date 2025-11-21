import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  final ValueNotifier<int> currentScreen;

  BottomBarWidget({super.key, required this.currentScreen});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentScreen.value,
      onTap: (value) {
        currentScreen.value = value;
      },
      items: [
        BottomNavigationBarItem(label: 'Inicio', icon: Icon(Icons.home)),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Historial'),
      ],
    );
  }
}
