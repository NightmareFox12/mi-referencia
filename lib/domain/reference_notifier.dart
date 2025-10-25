// reference_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_referencia/data/database/database.dart';
import 'package:mi_referencia/data/datasources/data_source.dart';

class ReferenceNotifier extends AsyncNotifier<List<Reference>> {
  @override
  Future<List<Reference>> build() async => [];

  Future<void> load() async {
    final db = AppDatabase();
    final data = await ReferenceDataSource(db).getAllReferences();

    // Asegúrate de que esto se llama después de que el notifier esté listo
    state = AsyncValue.data(data);
  }
}

final referenceProvider =
    AsyncNotifierProvider<ReferenceNotifier, List<Reference>>(
      ReferenceNotifier.new,
    );
