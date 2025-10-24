import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FabMenu extends HookWidget {
  final int currentScreen;

  const FabMenu({super.key, required this.currentScreen});

  @override
  Widget build(BuildContext context) {
    if (currentScreen != 0) return SizedBox.shrink();

    return Positioned(
      bottom: 16,
      right: 16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            heroTag: 'fab2',
            tooltip: 'Referencia Completa',
            onPressed: () {},
            child: Icon(Icons.assignment_add),
          ),

          SizedBox(height: 12),

          FloatingActionButton(
            heroTag: 'fab1',
            onPressed: () {},
            tooltip: 'Referencia Rápida',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
