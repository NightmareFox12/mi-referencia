import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mi_referencia/data/database/database.dart';
import 'package:mi_referencia/utils/format_amount.dart';

Future<void> showReferenceDetailsDialog(
  BuildContext context,
  Reference reference,
  Bank? bankInfo,
) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text('Resumen de Referencia'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                //Reference
                Text.rich(
                  style: TextStyle(fontSize: 17),
                  TextSpan(
                    children: [
                      TextSpan(text: 'N° de Referencia: '),
                      TextSpan(
                        text: '${reference.reference}',
                        style: TextStyle(fontWeight: .bold),
                      ),
                    ],
                  ),
                ),

                //Amount
                Text.rich(
                  style: TextStyle(fontSize: 17),
                  TextSpan(
                    children: [
                      TextSpan(text: 'Cantidad: '),
                      TextSpan(
                        text: '${formatAmount(reference.amount)} Bs.F',
                        style: TextStyle(fontWeight: .bold),
                      ),
                    ],
                  ),
                ),

                //Note
                reference.note == null
                    ? SizedBox.shrink()
                    : Text.rich(
                        style: TextStyle(fontSize: 17),
                        TextSpan(
                          children: [
                            TextSpan(text: 'Nota: '),
                            TextSpan(
                              text: '${reference.note}',
                              style: TextStyle(fontWeight: .bold),
                            ),
                          ],
                        ),
                      ),

                //Bank
                bankInfo == null
                    ? SizedBox.shrink()
                    : Text.rich(
                        style: TextStyle(fontSize: 17),
                        TextSpan(
                          children: [
                            TextSpan(text: 'Banco: '),
                            TextSpan(
                              text: '${bankInfo.name}',
                              style: TextStyle(fontWeight: .bold),
                            ),
                          ],
                        ),
                      ),

                //Phone
                reference.phone == null
                    ? SizedBox.shrink()
                    : Text.rich(
                        style: TextStyle(fontSize: 17),
                        TextSpan(
                          children: [
                            TextSpan(text: 'Télefono: '),
                            TextSpan(
                              text: '${reference.phone}',
                              style: TextStyle(fontWeight: .bold),
                            ),
                          ],
                        ),
                      ),

                //Date
                Text.rich(
                  style: TextStyle(fontSize: 17),
                  TextSpan(
                    children: [
                      TextSpan(text: 'Fecha de creacion: '),
                      TextSpan(
                        text:
                            '${DateFormat('dd/MM/yyyy').format(reference.date)}',
                        style: TextStyle(fontWeight: .bold),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 12),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: FilledButton.icon(
                    label: Text('Cerrar'),
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),

                // Expanded(
                //   child: OutlinedButton.icon(
                //     label: Text('Editar'),
                //     icon: Icon(Icons.edit),
                //     onPressed: () {
                //       Navigator.of(context).pop();
                //     },
                //   ),
                // ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
