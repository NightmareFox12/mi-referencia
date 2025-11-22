import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/data/database/database.dart';
import 'package:mi_referencia/domain/reference_provider.dart';
import 'package:mi_referencia/utils/format_amount.dart';

class LastReferences extends HookConsumerWidget {
  final ValueNotifier<int> currentScreen;
  const LastReferences({super.key, required this.currentScreen});

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
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Card.filled(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Últimas referencias",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),

                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  visualDensity: VisualDensity.compact,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  textStyle: const TextStyle(fontSize: 12),
                                  minimumSize: const Size(0, 30),
                                  iconSize: 12,
                                  iconAlignment: IconAlignment.end,
                                ),
                                onPressed: () => currentScreen.value = 1,
                                icon: Icon(Icons.arrow_forward_ios),
                                label: Text('Ver Todas'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) => ListTile(
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Text(error.toString()),
      ),
    );
  }
}
