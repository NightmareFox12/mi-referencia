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

    return Column(
      children: [
        Text(
          'Historial del ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
          style: TextStyle(fontWeight: .bold, fontSize: 17),
        ),
        Expanded(
          flex: 5,
          child: referencesAsync.when(
            data: (data) => data.isEmpty
                ? Center(
                    child: Text(
                      'No hay referencias',
                      style: TextStyle(fontWeight: .bold, fontSize: 20),
                    ),
                  )
                : ListView.separated(
                    itemCount: data.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const .only(left: 8, right: 8),
                      child: ListTile(
                        leading: Text('#${index + 1}'),
                        title: Text(
                          'Referencia: ${data[index].reference}',
                          style: TextStyle(fontWeight: .bold),
                          textAlign: .center,
                        ),

                        subtitle: Text(
                          'Monto: ${formatAmount(data[index].amount)} Bs.F',
                          textAlign: .center,
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
      ],
    );
  }
}
