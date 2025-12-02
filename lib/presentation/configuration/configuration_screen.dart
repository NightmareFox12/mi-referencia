import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/domain/theme_provider.dart';
import 'package:mi_referencia/presentation/widgets/delete_all_dialog.dart';

class ConfigurationScreen extends HookConsumerWidget {
  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeMode = ref.watch(themeModeProvider);

    return Column(
      children: [
        // GestureDetector(
        //   onTap: () {
        //     Navigator.of(context).push(
        //       MaterialPageRoute(builder: (context) => const AboutScreen()),
        //     );
        //   },
        //   child: ListTile(
        //     leading: const Icon(Icons.info),
        //     title: const Text('Información de la App'),
        //     trailing: const Icon(Icons.keyboard_arrow_right),
        //   ),
        // ),
        ListTile(
          leading: const Icon(Icons.dark_mode),
          title: const Text('Modo Oscuro'),
          trailing: Switch(
            value: currentThemeMode == ThemeMode.dark,
            onChanged: (value) async =>
                ref.read(themeModeProvider.notifier).toggleTheme(value),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDeleteAllDialog(context, ref);
          },
          child: ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Eliminar Información'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
        ),
      ],
    );
  }
}
