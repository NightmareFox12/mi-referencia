// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ReferenceItemTable extends ReferenceItem
    with TableInfo<$ReferenceItemTable, ReferenceItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReferenceItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _referenceIDMeta = const VerificationMeta(
    'referenceID',
  );
  @override
  late final GeneratedColumn<int> referenceID = GeneratedColumn<int>(
    'reference_i_d',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<int> reference = GeneratedColumn<int>(
    'reference',
    aliasedName,
    false,
    check: () => reference.cast<String>().length.equals(4),
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    referenceID,
    name,
    lastName,
    reference,
    amount,
    date,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reference_item';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReferenceItemData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('reference_i_d')) {
      context.handle(
        _referenceIDMeta,
        referenceID.isAcceptableOrUnknown(
          data['reference_i_d']!,
          _referenceIDMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    } else if (isInserting) {
      context.missing(_referenceMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {referenceID};
  @override
  ReferenceItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReferenceItemData(
      referenceID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reference_i_d'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      ),
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reference'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      ),
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
    );
  }

  @override
  $ReferenceItemTable createAlias(String alias) {
    return $ReferenceItemTable(attachedDatabase, alias);
  }
}

class ReferenceItemData extends DataClass
    implements Insertable<ReferenceItemData> {
  final int referenceID;
  final String? name;
  final String? lastName;
  final int reference;
  final double? amount;
  final DateTime date;
  const ReferenceItemData({
    required this.referenceID,
    this.name,
    this.lastName,
    required this.reference,
    this.amount,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['reference_i_d'] = Variable<int>(referenceID);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    map['reference'] = Variable<int>(reference);
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  ReferenceItemCompanion toCompanion(bool nullToAbsent) {
    return ReferenceItemCompanion(
      referenceID: Value(referenceID),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      reference: Value(reference),
      amount: amount == null && nullToAbsent
          ? const Value.absent()
          : Value(amount),
      date: Value(date),
    );
  }

  factory ReferenceItemData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReferenceItemData(
      referenceID: serializer.fromJson<int>(json['referenceID']),
      name: serializer.fromJson<String?>(json['name']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      reference: serializer.fromJson<int>(json['reference']),
      amount: serializer.fromJson<double?>(json['amount']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'referenceID': serializer.toJson<int>(referenceID),
      'name': serializer.toJson<String?>(name),
      'lastName': serializer.toJson<String?>(lastName),
      'reference': serializer.toJson<int>(reference),
      'amount': serializer.toJson<double?>(amount),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  ReferenceItemData copyWith({
    int? referenceID,
    Value<String?> name = const Value.absent(),
    Value<String?> lastName = const Value.absent(),
    int? reference,
    Value<double?> amount = const Value.absent(),
    DateTime? date,
  }) => ReferenceItemData(
    referenceID: referenceID ?? this.referenceID,
    name: name.present ? name.value : this.name,
    lastName: lastName.present ? lastName.value : this.lastName,
    reference: reference ?? this.reference,
    amount: amount.present ? amount.value : this.amount,
    date: date ?? this.date,
  );
  ReferenceItemData copyWithCompanion(ReferenceItemCompanion data) {
    return ReferenceItemData(
      referenceID: data.referenceID.present
          ? data.referenceID.value
          : this.referenceID,
      name: data.name.present ? data.name.value : this.name,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      reference: data.reference.present ? data.reference.value : this.reference,
      amount: data.amount.present ? data.amount.value : this.amount,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReferenceItemData(')
          ..write('referenceID: $referenceID, ')
          ..write('name: $name, ')
          ..write('lastName: $lastName, ')
          ..write('reference: $reference, ')
          ..write('amount: $amount, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(referenceID, name, lastName, reference, amount, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReferenceItemData &&
          other.referenceID == this.referenceID &&
          other.name == this.name &&
          other.lastName == this.lastName &&
          other.reference == this.reference &&
          other.amount == this.amount &&
          other.date == this.date);
}

class ReferenceItemCompanion extends UpdateCompanion<ReferenceItemData> {
  final Value<int> referenceID;
  final Value<String?> name;
  final Value<String?> lastName;
  final Value<int> reference;
  final Value<double?> amount;
  final Value<DateTime> date;
  const ReferenceItemCompanion({
    this.referenceID = const Value.absent(),
    this.name = const Value.absent(),
    this.lastName = const Value.absent(),
    this.reference = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
  });
  ReferenceItemCompanion.insert({
    this.referenceID = const Value.absent(),
    this.name = const Value.absent(),
    this.lastName = const Value.absent(),
    required int reference,
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
  }) : reference = Value(reference);
  static Insertable<ReferenceItemData> custom({
    Expression<int>? referenceID,
    Expression<String>? name,
    Expression<String>? lastName,
    Expression<int>? reference,
    Expression<double>? amount,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (referenceID != null) 'reference_i_d': referenceID,
      if (name != null) 'name': name,
      if (lastName != null) 'last_name': lastName,
      if (reference != null) 'reference': reference,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
    });
  }

  ReferenceItemCompanion copyWith({
    Value<int>? referenceID,
    Value<String?>? name,
    Value<String?>? lastName,
    Value<int>? reference,
    Value<double?>? amount,
    Value<DateTime>? date,
  }) {
    return ReferenceItemCompanion(
      referenceID: referenceID ?? this.referenceID,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      reference: reference ?? this.reference,
      amount: amount ?? this.amount,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (referenceID.present) {
      map['reference_i_d'] = Variable<int>(referenceID.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (reference.present) {
      map['reference'] = Variable<int>(reference.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReferenceItemCompanion(')
          ..write('referenceID: $referenceID, ')
          ..write('name: $name, ')
          ..write('lastName: $lastName, ')
          ..write('reference: $reference, ')
          ..write('amount: $amount, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ReferenceItemTable referenceItem = $ReferenceItemTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [referenceItem];
}

typedef $$ReferenceItemTableCreateCompanionBuilder =
    ReferenceItemCompanion Function({
      Value<int> referenceID,
      Value<String?> name,
      Value<String?> lastName,
      required int reference,
      Value<double?> amount,
      Value<DateTime> date,
    });
typedef $$ReferenceItemTableUpdateCompanionBuilder =
    ReferenceItemCompanion Function({
      Value<int> referenceID,
      Value<String?> name,
      Value<String?> lastName,
      Value<int> reference,
      Value<double?> amount,
      Value<DateTime> date,
    });

class $$ReferenceItemTableFilterComposer
    extends Composer<_$AppDatabase, $ReferenceItemTable> {
  $$ReferenceItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get referenceID => $composableBuilder(
    column: $table.referenceID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReferenceItemTableOrderingComposer
    extends Composer<_$AppDatabase, $ReferenceItemTable> {
  $$ReferenceItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get referenceID => $composableBuilder(
    column: $table.referenceID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReferenceItemTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReferenceItemTable> {
  $$ReferenceItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get referenceID => $composableBuilder(
    column: $table.referenceID,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<int> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);
}

class $$ReferenceItemTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReferenceItemTable,
          ReferenceItemData,
          $$ReferenceItemTableFilterComposer,
          $$ReferenceItemTableOrderingComposer,
          $$ReferenceItemTableAnnotationComposer,
          $$ReferenceItemTableCreateCompanionBuilder,
          $$ReferenceItemTableUpdateCompanionBuilder,
          (
            ReferenceItemData,
            BaseReferences<
              _$AppDatabase,
              $ReferenceItemTable,
              ReferenceItemData
            >,
          ),
          ReferenceItemData,
          PrefetchHooks Function()
        > {
  $$ReferenceItemTableTableManager(_$AppDatabase db, $ReferenceItemTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReferenceItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReferenceItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReferenceItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> referenceID = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<int> reference = const Value.absent(),
                Value<double?> amount = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
              }) => ReferenceItemCompanion(
                referenceID: referenceID,
                name: name,
                lastName: lastName,
                reference: reference,
                amount: amount,
                date: date,
              ),
          createCompanionCallback:
              ({
                Value<int> referenceID = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                required int reference,
                Value<double?> amount = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
              }) => ReferenceItemCompanion.insert(
                referenceID: referenceID,
                name: name,
                lastName: lastName,
                reference: reference,
                amount: amount,
                date: date,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReferenceItemTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReferenceItemTable,
      ReferenceItemData,
      $$ReferenceItemTableFilterComposer,
      $$ReferenceItemTableOrderingComposer,
      $$ReferenceItemTableAnnotationComposer,
      $$ReferenceItemTableCreateCompanionBuilder,
      $$ReferenceItemTableUpdateCompanionBuilder,
      (
        ReferenceItemData,
        BaseReferences<_$AppDatabase, $ReferenceItemTable, ReferenceItemData>,
      ),
      ReferenceItemData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ReferenceItemTableTableManager get referenceItem =>
      $$ReferenceItemTableTableManager(_db, _db.referenceItem);
}
