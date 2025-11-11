import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:mi_referencia/data/database/tables.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(tables: [BankItem, ReferenceItem])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) {
      // Esto le dice a Drift que cree TODAS las tablas definidas
      // en la anotación @DriftDatabase la primera vez.
      return m.createAll();
    },
    // Aquí puedes añadir onUpgrade si incrementas schemaVersion
    // onUpgrade: (Migrator m, int from, int to) async { ... }
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'reference_db',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
