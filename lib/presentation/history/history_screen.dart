import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/data/database/database.dart';
import 'package:mi_referencia/domain/reference_notifier.dart';

class HistoryScreen extends HookConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //states
    final AsyncValue<List<Reference>> referencesAsync = ref.watch(
      referenceProvider,
    );

    // //functions
    // Future<void> loadReferences() async {

    //   await ref.read(referenceProvider.notifier).load();
    // }

    //functions
    // Future<void> loadReferences() async =>
    // await ref.read(referenceProvider.notifier).load();

    return Column(
      children: [
        Expanded(
          flex: 3,
          child: referencesAsync.when(
            data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: ListTile(
                  // leading: Icon(Icons.abc_outlined),
                  title: Text(
                    data[index].reference.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  // subtitle: Text(
                  //   '#${data[index].referenceID}',
                  //   textAlign: TextAlign.center,
                  // ),
                  subtitle: Text(data[index].amount.toString()),
                ),
              ),
            ),

            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Text(error.toString()),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [Text('Monto total'), Text(494994944.toString())],
          ),
        ),
      ],
    );
  }
}
