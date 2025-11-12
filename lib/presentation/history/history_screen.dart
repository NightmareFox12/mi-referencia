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

    final trash = ref.watch(bankProvider);

    //FUNCTIONS
    setBank(String code, String name) async {
      ref.read(bankProvider.notifier).addBank();
    }

    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              FilledButton(
                onPressed: () async {
                  setBank('0102', 'Banco de Venezuela');
                  setBank('0156', '100% Banco');
                  setBank('0172', 'Bancamiga banco universal, C.A');
                  setBank('0114', 'Bancaribe');
                  setBank('0171', 'Banco Activo');
                  setBank('0128', 'Banco Caroní');
                  setBank('0163', 'Banco del Tesoro');
                  setBank('0175', 'Banco Digital De Los Trabajadores, Banco Universal');
                  setBank('0115', 'Banco Exterior');
                  setBank('0151', 'Banco Fondo Común');
                  setBank('0105', 'Banco Mercantil');
                  setBank('0191', 'Banco Nacional De Credito');
                  setBank('0138', 'Banco Plaza');
                  setBank('0137', 'Banco Sofitasa');
                  setBank('0104', 'Banco Venezolano de Credito');
                  setBank('0168', 'Bancrecer');
                  setBank('0134', 'Banesco');
                  setBank('0177', 'Banfanb');
                  setBank('0146', 'Bangente');
                  setBank('0174', 'Banplus');
                  setBank('0108', 'BBVA Provincial');
                  setBank('0157', 'Delsur Banco Universal');
                  setBank('0601', 'Instituto Municipal de Credito Popular');
                  setBank('0178', 'N58 Banco Digital Banco Microfinanciero S A');
                  setBank('0169', 'R4 Banco Microfinanciero C.A.');
                  

                },
                child: Text('MEMORY'),
              ),

              Text(trash.toString()),
            ],
          ),
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
                        // subtitle: Text(
                        //   '#${data[index].referenceID}',
                        //   textAlign: TextAlign.center,
                        // ),
                        subtitle: Text(
                          'Monto: ${formatAmount(data[index].amount)} Bs.F',
                          textAlign: TextAlign.center,
                        ),
                        trailing: Tooltip(
                          message: 'Ver detalles',
                          waitDuration: Duration(milliseconds: 500),
                          child: IconButton.filled(
                            onPressed: () => showReferenceDetailsDialog(
                              context,
                              data[index].referenceID,
                            ),
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
              children: [
                Text(
                  'Monto total',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                //TODO: llamar este button en otro component separado con HookConsumerWidget para evitar re-construir todo
                OutlinedButton(
                  onPressed: () =>
                      ref.read(referenceProvider.notifier).deleteAll(),
                  child: Text('eliminar todo'),
                ),

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
