import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/data/database/database.dart';
import 'package:mi_referencia/domain/reference_provider.dart';
import 'package:mi_referencia/utils/format_amount.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
      child: Skeletonizer(
        enabled: lastReferencesAsync.isLoading,
        enableSwitchAnimation: true,
        child:
            (lastReferencesAsync.value == null ||
                lastReferencesAsync.value!.isEmpty)
            ? Center(
                child: Text(
                  'Aún no hay referencias',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Últimas referencias",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: lastReferencesAsync.value!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Card.filled(
                          child: ListTile(
                            horizontalTitleGap: 0,
                            minTileHeight: 6,
                            leading: Text('#${index + 1}'),
                            title: Text(
                              'Referencia: ${lastReferencesAsync.value![index].reference}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              'Monto: ${formatAmount(lastReferencesAsync.value![index].amount)} Bs.F',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
