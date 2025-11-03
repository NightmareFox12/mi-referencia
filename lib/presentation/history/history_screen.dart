import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/data/database/database.dart';
import 'package:mi_referencia/domain/reference_provider.dart';
import 'package:intl/intl.dart';

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

                OutlinedButton(
                  onPressed: () =>
                      ref.read(referenceProvider.notifier).deleteAll(),
                  child: Text('eliminar todo'),
                ),

                totalAmountReferenceAsync.when(
                  data: (data) {
                    final formatter = NumberFormat('#,##0.0', 'es_VE');
                    final formatted = formatter.format(data);
                    return Text('$formatted Bs.F');
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: referencesAsync.when(
            data: (data) => ListView.separated(
              itemCount: data.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: ListTile(
                  // leading: Icon(Icons.abc_outlined),
                  title: Text(
                    'Referencia #${data[index].reference}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  // subtitle: Text(
                  //   '#${data[index].referenceID}',
                  //   textAlign: TextAlign.center,
                  // ),
                  subtitle: Text(
                    'Monto: ${data[index].amount}Bs.F',
                    textAlign: TextAlign.center,
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
      ],
    );
  }
}
