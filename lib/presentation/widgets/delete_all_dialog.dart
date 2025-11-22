import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/data/database/database.dart';
import 'package:mi_referencia/domain/reference_provider.dart';
import 'package:mi_referencia/presentation/theme/custom_style.dart';

Future<void> showDeleteAllDialog(BuildContext context, WidgetRef ref) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      final AsyncValue<List<Reference>> referenceAsync = ref.watch(
        referenceProvider,
      );

      return AlertDialog(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Icon(Icons.report, color: Colors.black),
            Text('Advertencia', textAlign: TextAlign.center),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: '¿Estás seguro de eliminar todas las referencias?',
                  ),
                  TextSpan(
                    text: ' Una vez eliminadas no se podrá recuperar.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          OutlinedButton(
            child: Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(),
          ),

          FilledButton.icon(
            style: dangerButton(context),
            onPressed:
                (referenceAsync.value == null || referenceAsync.value!.isEmpty)
                ? null
                : () {
                    ref.read(referenceProvider.notifier).deleteAll();
                    Navigator.of(context).pop();
                  },
            icon: Icon(Icons.delete),
            label: Text('Eliminar'),
          ),
        ],
      );
    },
  );
}
