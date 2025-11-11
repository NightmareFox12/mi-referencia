import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_referencia/data/database/database.dart';
import 'package:mi_referencia/data/datasources/bank_data_source.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final bankDataSourceProvider = Provider<BankDataSource>((ref) {
  final db = ref.watch(databaseProvider);
  return BankDataSource(db);
});

class BankProvider extends AsyncNotifier<List<Bank>> {
  @override
  Future<List<Bank>> build() async {
    final dataSource = ref.watch(bankDataSourceProvider);
    return await dataSource.getAllBanks();
  }

  Future<void> addBank(String code, String name) async {
    final dataSource = ref.read(bankDataSourceProvider);
    await dataSource.setBank(BankItemCompanion.insert(code: code, name: name));
    ref.invalidateSelf();
  }
}

final bankProvider = AsyncNotifierProvider<BankProvider, List<Bank>>(
  BankProvider.new,
);
