import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FabFastReference extends HookWidget {
  Future<void> showFastReferenceDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
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
                  decoration: const InputDecoration(
                    // icon: Icon(Icons.person),
                    hintText: 'Ej: 2534',
                    labelText: 'Referencia *',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
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
                    // This optional block of code can be used to run
                    // code when the user saves the form.
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
              onPressed: () {
                Navigator.of(context).pop();
                //TODO: luego de guardar la referencia mostrarle un toast y cerrar el modal
              },
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
