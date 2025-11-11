import 'package:drift/drift.dart';

@DataClassName('Reference')
class ReferenceItem extends Table {
  IntColumn get referenceID => integer().autoIncrement()();
  IntColumn get bankID => integer().nullable().references(BankItem, #bankID)();
  TextColumn get note => text().withLength(min: 2, max: 50).nullable()();
  TextColumn get phone => text().withLength(min: 12, max: 12).nullable()();
  IntColumn get reference =>
      integer().check(reference.cast<String>().length.equals(4))();
  RealColumn get amount => real()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('Bank')
class BankItem extends Table {
  IntColumn get bankID => integer().autoIncrement()();
  IntColumn get code => integer()();
  TextColumn get name => text().withLength(min: 2, max: 50)();
}
