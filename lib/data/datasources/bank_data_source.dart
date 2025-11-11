import 'package:drift/drift.dart';
import 'package:mi_referencia/data/database/database.dart';

class BankDataSource {
  final AppDatabase db;

  BankDataSource(this.db);

  //CRUD
  Future<List<Bank>> getAllBanks() {
    return db.select(db.bankItem).get();
  }

  Future<int> setBank(BankItemCompanion bank) async {
    return db.into(db.bankItem).insert(bank);
  }
}
