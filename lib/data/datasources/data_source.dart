import 'package:mi_referencia/data/datasources/database.dart';
import 'package:drift/drift.dart';

class ReferenceDataSource {
  final AppDatabase db;

  ReferenceDataSource(this.db);

  Future<List<Reference>> getAllReferences() {
    return db.select(db.referenceItem).get();
  }

  Future<int> setReference(Reference reference) async {
    return db.into(db.referenceItem).insert(reference);
  }

  Future<int> setFastReference(int reference, double amount) async {
    return db
        .into(db.referenceItem)
        .insert(
          ReferenceItemCompanion.insert(
            reference: reference,
            amount: Value(amount),
          ),
        );
  }
}
