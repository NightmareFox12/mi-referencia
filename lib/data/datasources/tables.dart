import 'package:drift/drift.dart';

class ReferenceItem extends Table {
  IntColumn get referenceID => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 6, max: 32).nullable()();
  TextColumn get lastName => text().nullable()();
  IntColumn get reference =>
      integer().check(reference.cast<String>().length.equals(4))();
  RealColumn get amount => real().nullable()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
}
