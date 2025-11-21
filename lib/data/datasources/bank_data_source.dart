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

  Future<Bank> getBankInfo(int bankID) async {
    final query = db.select(db.bankItem);
    query.where((bank) => bank.bankID.equals(bankID));
    return await query.getSingle();
  }
}
