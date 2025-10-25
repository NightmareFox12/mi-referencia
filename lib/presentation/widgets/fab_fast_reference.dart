import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mi_referencia/data/datasources/data_source.dart';
import 'package:mi_referencia/data/datasources/database.dart';

class FabFastReference extends HookWidget {
  final db = AppDatabase();

  //states
  final reference = useState<int>(0);
  final amount = useState<double>(0);

  final referenceErr = useState<String?>(null);
  final amountErr = useState<String?>(null);

  validateReference(String value) {
    if (value.isEmpty) referenceErr.value = null;
    final number = int.tryParse(value);

    if (number == null)
      referenceErr.value = 'El valor ingresado no es un número válido.';
  }

  Future<void> addFastReference() async {
    final id = await ReferenceDataSource(
      db,
    ).setFastReference(reference.value, amount.value);

    print(id);
    //TODO: Meter TOAST
  }

  Future<void> showFastReferenceDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
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
                    reference.value = int.parse(value);
                    validateReference(value);
                  },
                ),
                SizedBox(height: 12),

                TextFormField(
                  decoration: const InputDecoration(
                    // icon: Icon(Icons.person),
                    hintText: 'Ej: 100',
                    labelText: 'Monto Bs.F *',
                    suffixText: 'Bs.F',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (String? value) {
                    if (value != null) amount.value = double.parse(value);
                  },
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
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
              onPressed: () => addFastReference(),
              // onPressed: () {

              //   // Navigator.of(context).pop();
              // },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'fab1',
      onPressed: () => showFastReferenceDialog(context),
      tooltip: 'Referencia Rápida',
      child: const Icon(Icons.add),
    );
  }
}
