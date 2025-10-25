import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/domain/reference_notifier.dart';
import 'package:mi_referencia/data/datasources/data_source.dart';
import 'package:mi_referencia/data/database/database.dart';

class HistoryScreen extends HookConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = AppDatabase();
    final reference = ReferenceNotifier();

    //states
    final references = useState<List<Reference>>([]);

    // final String jsjs = ref.watch(reference);

    useEffect(() {

      Future<void> loadReferences() async {
        print(reference.load());

        final data = await ReferenceDataSource(db).getAllReferences();
        references.value = data;
      }

      loadReferences();

      return null;
    }, []);

    return Column(
      children: references.value
          .map((reference) => Text(reference.toString()))
          .toList(),
    );
  }
}
