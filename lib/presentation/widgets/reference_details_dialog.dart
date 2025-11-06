import 'package:flutter/material.dart';

Future<void> showReferenceDetailsDialog(BuildContext context, int referenceID) {
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

                SizedBox(height: 12),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    label: Text('Cancelar'),
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),

                Expanded(
                  child: OutlinedButton.icon(
                    label: Text('Editar'),
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),

            // FilledButton.icon(
            //   label: Text('Guardar'),
            //   icon: Icon(Icons.check),
            //   onPressed: () => ref
            //       .read(referenceProvider.notifier)
            //       .addFastReference(reference.value, amount.value),
            //   // addFastReference(ref, reference, amount, referencesAsync),
            //   // onPressed: () {

            //   //   // Navigator.of(context).pop();
            //   // },
            // ),
          ],
        ),
      );
    },
  );
}
