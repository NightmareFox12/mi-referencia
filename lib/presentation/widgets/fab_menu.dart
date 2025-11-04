import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mi_referencia/presentation/reference_form/reference_form_screen.dart';
import 'package:mi_referencia/presentation/widgets/fab_fast_reference.dart';

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
          IgnorePointer(
            ignoring: currentScreen != 0,
            child: AnimatedOpacity(
              opacity: currentScreen == 0 ? 1 : 0,
              duration: Duration(milliseconds: 400),
              child: FloatingActionButton.small(
                heroTag: 'fab2',
                tooltip: 'Referencia Completa',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReferenceFormScreen(),
                  ),
                ),
                child: Icon(Icons.assignment_add),
              ),
            ),
          ),

          SizedBox(height: 10),

          FabFastReference(),
        ],
      ),
    );
  }
}
