import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_referencia/data/database/database.dart';
import 'package:mi_referencia/data/datasources/reference_data_source.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final referenceDataSourceProvider = Provider<ReferenceDataSource>((ref) {
  final db = ref.watch(databaseProvider);
  return ReferenceDataSource(db);
});

class ReferenceProvider extends AsyncNotifier<List<Reference>> {
  @override
  Future<List<Reference>> build() async {
    final dataSource = ref.watch(referenceDataSourceProvider);
    return await dataSource.getAllReferences();
  }

  Future<void> addReference(Reference reference) async {
    final dataSource = ref.read(referenceDataSourceProvider);
    await dataSource.setReference(reference);
    ref.invalidateSelf(); // Recargar la lista
  }

  Future<void> addFastReference(int reference, double amount) async {
    final dataSource = ref.read(referenceDataSourceProvider);
    await dataSource.setFastReference(reference, amount);
    ref.invalidateSelf();
  }

  Future<void> deleteAll() async {
    final dataSource = ref.read(referenceDataSourceProvider);
    await dataSource.deleteAll();
    ref.invalidateSelf();
  }

  // Future<void> refresh() async {
  //   ref.invalidateSelf();
  //   await future;
  // }
}

final referenceProvider =
    AsyncNotifierProvider<ReferenceProvider, List<Reference>>(
      ReferenceProvider.new,
    );

// 3. Para las CONSULTAS, usa FutureProviders simples (NO Notifiers)
final totalAmountProvider = FutureProvider<double>((ref) async {
  final dataSource = ref.watch(referenceDataSourceProvider);

  // Escuchar cambios en las referencias para actualizar automáticamente
  ref.watch(referenceProvider);

  return await dataSource.getAmountTotalReference();
});


// class AmountTotalNotifier extends AsyncNotifier<double> {
//   @override
//   Future<double> build() async {
//     final db = AppDatabase();
//     return await ReferenceDataSource(db).getAmountTotalReference();
//   }

//   Future<void> refresh() async {
//     state = const AsyncValue.loading();
//     final db = AppDatabase();
//     final total = await ReferenceDataSource(db).getAmountTotalReference();
//     state = AsyncValue.data(total);
//   }
// }

// final amountTotalProvider = AsyncNotifierProvider<AmountTotalNotifier, double>(
//   AmountTotalNotifier.new,
// );