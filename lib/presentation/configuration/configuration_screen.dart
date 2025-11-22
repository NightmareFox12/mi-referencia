import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ConfigurationScreen extends HookWidget {
  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.monochrome_photos),
          title: Text('Modo oscuro'),
          trailing: Switch(value: true, onChanged: (value) {}),
        ),
        GestureDetector(
          onTap: () {
            print("object");
          },
          child: ListTile(
            leading: Icon(Icons.delete),
            title: Text('Eliminar Información'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ),
      ],
    );
  }
}
