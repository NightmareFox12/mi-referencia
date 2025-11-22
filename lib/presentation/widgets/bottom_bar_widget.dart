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
      //TODO: Agregar vbanco
      // config donde ira modo oscuro y eliminar datos
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Historial'),
      ],
    );
  }
}
