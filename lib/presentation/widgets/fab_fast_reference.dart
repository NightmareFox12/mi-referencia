import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/data/datasources/data_source.dart';
import 'package:mi_referencia/data/database/database.dart';
import 'package:mi_referencia/domain/reference_provider.dart';

class FabFastReference extends HookConsumerWidget {
  final db = AppDatabase();

  Future<void> addFastReference(
    WidgetRef ref,
    ValueNotifier<int> reference,
    ValueNotifier<double> amount,
    AsyncValue<List<Reference>> referencesAsync,
  ) async {
    await ReferenceDataSource(
      db,
    ).setFastReference(reference.value, amount.value);

    //TODO: Meter TOAST
    //TODO: Reiniciar los inputs luego de guardar
    //TODO: cerrar modal
  }

  Future<void> showFastReferenceDialog(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<int> reference,
    ValueNotifier<double> amount,
    ValueNotifier<String?> referenceErr,
    ValueNotifier<String?> amountErr,
    AsyncValue<List<Reference>> referencesAsync,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: Text('Referencia'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Nose que poner aqui'),
                  SizedBox(height: 10),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    forceErrorText: referenceErr.value,
                    decoration: const InputDecoration(
                      // icon: Icon(Icons.person),
                      hintText: 'Ej: 2534',
                      labelText: 'Referencia *',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      final parsedNumber = int.tryParse(value);
                      if (parsedNumber != null) {
                        reference.value = parsedNumber;

                        if (value.isNotEmpty && value.length < 4) {
                          referenceErr.value = 'La referencia no es válida.';
                        } else
                          referenceErr.value = null;
                      } else {
                        if (value.isNotEmpty)
                          referenceErr.value = 'La referencia no es válida.';
                      }

                      setState(() => {});
                    },
                  ),
                  SizedBox(height: 12),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    forceErrorText: amountErr.value,
                    decoration: const InputDecoration(
                      hintText: 'Ej: 100',
                      labelText: 'Monto (Bs.F) *',
                      suffixText: 'Bs.F',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      final parsedNumber = double.tryParse(value);
                      if (parsedNumber != null) {
                        amount.value = parsedNumber;
                        amountErr.value = null;
                      } else {
                        if (value.isNotEmpty)
                          amountErr.value = 'El monto no es válido.';
                      }

                      setState(() => {});
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              OutlinedButton.icon(
                label: Text('Cancelar'),
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

              FilledButton.icon(
                label: Text('Guardar'),
                icon: Icon(Icons.check),
                onPressed: () => ref
                    .read(referenceProvider.notifier)
                    .addFastReference(reference.value, amount.value),
                // addFastReference(ref, reference, amount, referencesAsync),
                // onPressed: () {

                //   // Navigator.of(context).pop();
                // },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final referencesAsync = ref.watch(referenceProvider);

    //states
    final reference = useState<int>(0);
    final amount = useState<double>(0);
    final referenceErr = useState<String?>(null);
    final amountErr = useState<String?>(null);

    return FloatingActionButton(
      heroTag: 'fab1',
      onPressed: () => showFastReferenceDialog(
        context,
        ref,
        reference,
        amount,
        referenceErr,
        amountErr,
        referencesAsync,
      ),
      tooltip: 'Referencia Rápida',
      child: const Icon(Icons.add),
    );
  }
}
