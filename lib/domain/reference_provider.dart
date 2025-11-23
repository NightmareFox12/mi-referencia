import 'package:drift/drift.dart';
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

  Future<void> addReference(
    String? note,
    String? phone,
    int? bankID,
    int reference,
    double amount,
  ) async {
    final dataSource = ref.read(referenceDataSourceProvider);
    await dataSource.setReference(
      ReferenceItemCompanion.insert(
        note: Value(note),
        phone: Value(phone),
        bankID: Value(bankID),
        reference: reference,
        amount: amount,
      ),
    );
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

  ref.watch(referenceProvider);

  return await dataSource.getAmountTotalReference();
});

final lastReferencesProvider = FutureProvider<List<Reference>>((ref) async {
  final dataSource = ref.watch(referenceDataSourceProvider);

  ref.watch(referenceProvider);
  // await Future.delayed(const Duration(seconds: 10));

  return await dataSource.getLastReferences();
});

final lastReferencesWeekProvider = FutureProvider<List<Reference>>((ref) async {
  final dataSource = ref.watch(referenceDataSourceProvider);

  ref.watch(referenceProvider);

  return await dataSource.getLastWeekReferences();
});
