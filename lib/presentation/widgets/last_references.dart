import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/data/database/database.dart';
import 'package:mi_referencia/domain/bank_provider.dart';
import 'package:mi_referencia/domain/reference_provider.dart';
import 'package:mi_referencia/presentation/widgets/reference_details_dialog.dart';
import 'package:mi_referencia/utils/format_amount.dart';

class LastReferences extends HookConsumerWidget {
  const LastReferences({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //watch
    final AsyncValue<List<Reference>> lastReferencesAsync = ref.watch(
      lastReferencesProvider,
    );
    return Expanded(
      flex: 5,
      child: lastReferencesAsync.when(
        data: (data) => data.isEmpty
            ? Center(
                child: Text(
                  'No hay referencias',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )
            : Card(
                child: ListView.separated(
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
                                  .watch(bankInfoProvider(data[index].bankID!))
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
              ),

        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Text(error.toString()),
      ),
    );
  }
}
