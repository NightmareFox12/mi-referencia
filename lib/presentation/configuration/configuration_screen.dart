import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/presentation/about_screen/about_screen.dart';
import 'package:mi_referencia/presentation/widgets/delete_all_dialog.dart';

class ConfigurationScreen extends HookConsumerWidget {
  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AboutScreen()),
            );
          },
          child: ListTile(
            leading: Icon(Icons.info),
            title: Text('Información de la App'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDeleteAllDialog(context, ref);
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
