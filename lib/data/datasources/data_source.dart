import 'package:drift/drift.dart';
import 'package:mi_referencia/data/database/database.dart';

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
          ReferenceItemCompanion.insert(reference: reference, amount: amount),
        );
  }

  // COUNT
  Future<double> getAmountTotalReference() async {
    final sumExpression = db.referenceItem.amount.sum();
    final query = db.selectOnly(db.referenceItem)..addColumns([sumExpression]);
    final result = await query.getSingleOrNull();

    return result?.read(sumExpression) ?? 0.0;
  }

  // AVG (promedio)
  Future<double> getAverageAmount() async {
    final avgExpression = db.referenceItem.amount.avg();
    final query = db.selectOnly(db.referenceItem)..addColumns([avgExpression]);
    final result = await query.getSingleOrNull();
    return result?.read(avgExpression) ?? 0.0;
  }

  // MAX
  Future<double> getMaxAmount() async {
    final maxExpression = db.referenceItem.amount.max();
    final query = db.selectOnly(db.referenceItem)..addColumns([maxExpression]);
    final result = await query.getSingleOrNull();
    return result?.read(maxExpression) ?? 0.0;
  }
}
