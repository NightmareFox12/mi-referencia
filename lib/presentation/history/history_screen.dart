import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/data/database/database.dart';
import 'package:mi_referencia/domain/bank_provider.dart';
import 'package:mi_referencia/domain/reference_provider.dart';
import 'package:mi_referencia/presentation/widgets/reference_details_dialog.dart';
import 'package:mi_referencia/utils/format_amount.dart';

class HistoryScreen extends HookConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //states
    final AsyncValue<List<Reference>> referencesAsync = ref.watch(
      referenceProvider,
    );

    final totalAmountReferenceAsync = ref.watch(totalAmountProvider);

    return Column(
      children: [
        Text(
          'Historial del ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Expanded(
          flex: 5,
          child: referencesAsync.when(
            data: (data) => data.isEmpty
                ? Center(
                    child: Text(
                      'No hay referencias',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                : ListView.separated(
                    itemCount: data.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: ListTile(
                        leading: Text('#${index + 1}'),
                        title: Text(
                          'Referencia: ${data[index].reference}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),

                        subtitle: Text(
                          'Monto: ${formatAmount(data[index].amount)} Bs.F',
                          textAlign: TextAlign.center,
                        ),
                        trailing: Tooltip(
                          message: 'Ver detalles',
                          waitDuration: Duration(milliseconds: 500),
                          child: IconButton.filled(
                            onPressed: () {
                              Bank? bankInfo;
                              if (data[index].bankID != null) {
                                bankInfo = ref
                                    .watch(
                                      bankInfoProvider(data[index].bankID!),
                                    )
                                    .value;
                              }
                              showReferenceDetailsDialog(
                                context,
                                data[index],
                                bankInfo,
                              );
                            },
                            icon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  ),

            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Text(error.toString()),
          ),
        ),

        //TODO: cuando abro el teclado este niño se estripa bottom overflowed by 26 pixels. La solucion que se me ocurre es ocultarlo ya que con modal abierto no importa, la segunda opcion es buscar que siga el size de la screen y evitar eso al abir el teclado

        //TODO: agregar todos los bancos
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Monto total',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                //TODO: llamar este button en otro component separado con HookConsumerWidget para evitar re-construir todo
                // OutlinedButton(
                //   onPressed: () =>
                //       ref.read(referenceProvider.notifier).deleteAll(),
                //   child: Text('eliminar todo'),
                // ),
                totalAmountReferenceAsync.when(
                  data: (data) {
                    return Text('${formatAmount(data)} Bs.F');
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
