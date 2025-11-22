import 'package:flutter/material.dart';

ButtonStyle dangerButton(BuildContext context) {
  final brightness = Theme.brightnessOf(context);

  if (brightness == Brightness.light) {
    return ButtonStyle(
      backgroundColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.grey;
        }
        return Colors.red;
      }),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    );
  } else {
    return ButtonStyle(
      backgroundColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.grey;
        }
        return Colors.redAccent;
      }),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    );
  }
}
