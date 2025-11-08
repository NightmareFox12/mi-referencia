import 'package:drift/drift.dart';

@DataClassName('Reference')
class ReferenceItem extends Table {
  IntColumn get referenceID => integer().autoIncrement()();
  TextColumn get note => text().withLength(min: 2, max: 50).nullable()();
  // TextColumn get name => text().nullable()();
  IntColumn get reference =>
      integer().check(reference.cast<String>().length.equals(4))();
  RealColumn get amount => real()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
}