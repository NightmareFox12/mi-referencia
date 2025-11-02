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

    // useEffect(() {
    //   loadReferences();
    //   return null;
    // }, []);

    return Column(
      children: [
        Expanded(
          child: referencesAsync.when(
            data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.abc_outlined),
                title: Text(data[index].reference.toString()),
                subtitle: Text('#${data[index].referenceID}'),
                trailing: Icon(Icons.abc_sharp),
              ),
            ),

            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Text(error.toString()),
          ),
        ),
      ],
    );
  }
}
