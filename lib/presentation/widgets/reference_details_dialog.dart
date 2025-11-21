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
          title: Text('Referencia'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                //Reference
                Text.rich(
                  style: TextStyle(fontSize: 17),
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'N° de Referencia: ', // Título
                      ),
                      TextSpan(
                        text: '${reference.reference}', // Dato (Normal)
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                //Amount
                Text.rich(
                  style: TextStyle(fontSize: 17),
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Cantidad: ', // Título
                      ),
                      TextSpan(
                        text: '${formatAmount(reference.amount)} Bs.F',
                        style: TextStyle(fontWeight: FontWeight.bold),
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
                            TextSpan(
                              text: 'Nota: ', // Título
                            ),
                            TextSpan(
                              text: '${reference.note}',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                            TextSpan(
                              text: 'Banco: ', // Título
                            ),
                            TextSpan(
                              text: '${bankInfo.name}',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                            TextSpan(
                              text: 'Télefono: ', // Título
                            ),
                            TextSpan(
                              text: '${reference.phone}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                //Date
                Text.rich(
                  style: TextStyle(fontSize: 17),
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Fecha de creacion: ', // Título
                      ),
                      TextSpan(
                        text:
                            '${DateFormat('dd/MM/yyyy').format(reference.date)}',
                        style: TextStyle(fontWeight: FontWeight.bold),
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
          ],
        ),
      );
    },
  );
}
