import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/data/database/database.dart';
import 'package:mi_referencia/domain/reference_provider.dart';
import 'package:mi_referencia/utils/format_amount.dart';

class FabFastReference extends HookConsumerWidget {
  Future<void> showFastReferenceDialog(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<String> reference,
    ValueNotifier<String> amount,
    AsyncValue<List<Reference>> referencesAsync,
  ) async {
    //controllers
    final referenceController = TextEditingController();
    final amountController = TextEditingController();

    //error msg
    String? errorReferenceMsg() {
      final msg = "La referencia no es válida.";

      if (reference.value.isEmpty) return null;

      final regExp = RegExp(r'^\d{4}$');
      if (regExp.hasMatch(reference.value))
        return null;
      else
        return msg;
    }

    final TextInputFormatter amountFormatter = TextInputFormatter.withFunction((
      oldValue,
      newValue,
    ) {
      const int maxDigits = 10;
      const double maxValue = 999999999.0;

      String cleanText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

      if (cleanText.length > maxDigits) return oldValue;

      if (cleanText.isEmpty) {
        return const TextEditingValue(
          text: '',
          selection: TextSelection.collapsed(offset: 0),
        );
      }

      double? parsedAmount = double.tryParse(cleanText);

      if (parsedAmount == null) return oldValue;
      if (parsedAmount > maxValue) return oldValue;

      String formatted = formatAmount(parsedAmount);
      int offset = formatted.length;

      return TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: offset),
      );
    });

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: Text('Guardar Referencia'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    controller: referenceController,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: false,
                      signed: false,
                    ),
                    forceErrorText: errorReferenceMsg(),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      // icon: Icon(Icons.pin),
                      hintText: 'Ej. 2294',
                      labelText: 'Referencia *',
                    ),
                    onChanged: (value) => reference.value = value,
                    maxLength: 4,
                  ),

                  SizedBox(height: 6),

                  TextFormField(
                    controller: amountController,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                    ),
                    inputFormatters: [amountFormatter],
                    decoration: const InputDecoration(
                      // icon: Icon(Icons.attach_money),
                      hintText: 'Ej. 100,00',
                      labelText: 'Monto *',
                      border: OutlineInputBorder(),
                      suffixText: 'Bs.F',
                    ),
                    onChanged: (value) => amount.value = value,
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
                onPressed:
                    (referenceController.text.isEmpty ||
                        amountController.text.isEmpty)
                    ? null
                    : () {
                        ref
                            .read(referenceProvider.notifier)
                            .addReference(
                              null,
                              null,
                              null,
                              int.parse(reference.value),
                              parseAmount(amount.value),
                            );
                        Navigator.of(context).pop();
                      },
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
    final reference = useState<String>('');
    final amount = useState<String>('');

    return FloatingActionButton(
      heroTag: 'fab1',
      onPressed: () => showFastReferenceDialog(
        context,
        ref,
        reference,
        amount,
        referencesAsync,
      ),
      tooltip: 'Referencia Rápida',
      child: const Icon(Icons.add),
    );
  }
}
