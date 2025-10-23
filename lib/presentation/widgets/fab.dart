import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mi_referencia/presentation/reference/reference_form.dart';

class Fab extends HookWidget {
  final int currentScreen;

  const Fab({super.key, required this.currentScreen});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: currentScreen != 0,
      child: AnimatedOpacity(
        opacity: currentScreen == 0 ? 1 : 0,
        duration: Duration(milliseconds: 400),
        child: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReferenceForm()),
          ),
          tooltip: 'Increment',
          child: Icon(Icons.create),
        ),
      ),
    );
  }
}
