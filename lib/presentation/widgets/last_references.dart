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
      child: Column(
        children: [
          Padding(
            padding: const .only(top: 4, left: 12, right: 12),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "Últimas referencias",
                  style: TextStyle(fontWeight: .bold, fontSize: 18),
                ),
                ElevatedButton.icon(
                  iconAlignment: .end,
                  onPressed: () => currentScreen.value = 1,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(20, 25),
                    padding: const .symmetric(horizontal: 10, vertical: 5),
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                  label: const Text('Ver todo'),
                  icon: const Icon(Icons.arrow_right),
                ),
              ],
            ),
          ),
          Expanded(
            child: Skeletonizer(
              enabled: lastReferencesAsync.isLoading,
              enableSwitchAnimation: true,
              child: lastReferencesAsync.value == null
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) => Padding(
                          padding: const .symmetric(vertical: 4, horizontal: 8),
                          child: SizedBox(
                            width: .maxFinite,
                            height: 50,
                            child: Skeleton.replace(child: Card.filled()),
                          ),
                        ),
                      ),
                    )
                  : lastReferencesAsync.value!.isEmpty
                  ? Center(
                      child: Text(
                        'Aún no hay referencias',
                        style: TextStyle(fontWeight: .bold, fontSize: 20),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: lastReferencesAsync.value!.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const .symmetric(horizontal: 4, vertical: 0),
                          child: Card.filled(
                            child: ListTile(
                              horizontalTitleGap: 0,
                              minTileHeight: 6,
                              leading: Text('#${index + 1}'),
                              title: Text(
                                'Referencia: ${lastReferencesAsync.value![index].reference}',
                                style: TextStyle(fontWeight: .bold),
                                textAlign: .center,
                              ),
                              subtitle: Text(
                                'Monto: ${formatAmount(lastReferencesAsync.value![index].amount)} Bs.F',
                                textAlign: .center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
