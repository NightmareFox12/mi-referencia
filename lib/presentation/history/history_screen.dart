import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mi_referencia/data/datasources/data_source.dart';
import 'package:mi_referencia/data/datasources/database.dart';

class HistoryScreen extends HookWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = AppDatabase();

    //states
    final references = useState<List<Reference>>([]);

    useEffect(() {
      Future<void> loadReferences() async {
        final data = await ReferenceDataSource(db).getAllReferences();
        print(references);
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
