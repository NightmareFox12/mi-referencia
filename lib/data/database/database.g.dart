// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ReferenceItemTable extends ReferenceItem
    with TableInfo<$ReferenceItemTable, Reference> {
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
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 12,
      maxTextLength: 12,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bankMeta = const VerificationMeta('bank');
  @override
  late final GeneratedColumn<String> bank = GeneratedColumn<String>(
    'bank',
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
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
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
    note,
    phone,
    bank,
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
    Insertable<Reference> instance, {
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
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('bank')) {
      context.handle(
        _bankMeta,
        bank.isAcceptableOrUnknown(data['bank']!, _bankMeta),
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
    } else if (isInserting) {
      context.missing(_amountMeta);
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
  Reference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reference(
      referenceID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reference_i_d'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      bank: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank'],
      ),
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reference'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
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

class Reference extends DataClass implements Insertable<Reference> {
  final int referenceID;
  final String? note;
  final String? phone;
  final String? bank;
  final int reference;
  final double amount;
  final DateTime date;
  const Reference({
    required this.referenceID,
    this.note,
    this.phone,
    this.bank,
    required this.reference,
    required this.amount,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['reference_i_d'] = Variable<int>(referenceID);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || bank != null) {
      map['bank'] = Variable<String>(bank);
    }
    map['reference'] = Variable<int>(reference);
    map['amount'] = Variable<double>(amount);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  ReferenceItemCompanion toCompanion(bool nullToAbsent) {
    return ReferenceItemCompanion(
      referenceID: Value(referenceID),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      bank: bank == null && nullToAbsent ? const Value.absent() : Value(bank),
      reference: Value(reference),
      amount: Value(amount),
      date: Value(date),
    );
  }

  factory Reference.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reference(
      referenceID: serializer.fromJson<int>(json['referenceID']),
      note: serializer.fromJson<String?>(json['note']),
      phone: serializer.fromJson<String?>(json['phone']),
      bank: serializer.fromJson<String?>(json['bank']),
      reference: serializer.fromJson<int>(json['reference']),
      amount: serializer.fromJson<double>(json['amount']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'referenceID': serializer.toJson<int>(referenceID),
      'note': serializer.toJson<String?>(note),
      'phone': serializer.toJson<String?>(phone),
      'bank': serializer.toJson<String?>(bank),
      'reference': serializer.toJson<int>(reference),
      'amount': serializer.toJson<double>(amount),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Reference copyWith({
    int? referenceID,
    Value<String?> note = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> bank = const Value.absent(),
    int? reference,
    double? amount,
    DateTime? date,
  }) => Reference(
    referenceID: referenceID ?? this.referenceID,
    note: note.present ? note.value : this.note,
    phone: phone.present ? phone.value : this.phone,
    bank: bank.present ? bank.value : this.bank,
    reference: reference ?? this.reference,
    amount: amount ?? this.amount,
    date: date ?? this.date,
  );
  Reference copyWithCompanion(ReferenceItemCompanion data) {
    return Reference(
      referenceID: data.referenceID.present
          ? data.referenceID.value
          : this.referenceID,
      note: data.note.present ? data.note.value : this.note,
      phone: data.phone.present ? data.phone.value : this.phone,
      bank: data.bank.present ? data.bank.value : this.bank,
      reference: data.reference.present ? data.reference.value : this.reference,
      amount: data.amount.present ? data.amount.value : this.amount,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reference(')
          ..write('referenceID: $referenceID, ')
          ..write('note: $note, ')
          ..write('phone: $phone, ')
          ..write('bank: $bank, ')
          ..write('reference: $reference, ')
          ..write('amount: $amount, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(referenceID, note, phone, bank, reference, amount, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reference &&
          other.referenceID == this.referenceID &&
          other.note == this.note &&
          other.phone == this.phone &&
          other.bank == this.bank &&
          other.reference == this.reference &&
          other.amount == this.amount &&
          other.date == this.date);
}

class ReferenceItemCompanion extends UpdateCompanion<Reference> {
  final Value<int> referenceID;
  final Value<String?> note;
  final Value<String?> phone;
  final Value<String?> bank;
  final Value<int> reference;
  final Value<double> amount;
  final Value<DateTime> date;
  const ReferenceItemCompanion({
    this.referenceID = const Value.absent(),
    this.note = const Value.absent(),
    this.phone = const Value.absent(),
    this.bank = const Value.absent(),
    this.reference = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
  });
  ReferenceItemCompanion.insert({
    this.referenceID = const Value.absent(),
    this.note = const Value.absent(),
    this.phone = const Value.absent(),
    this.bank = const Value.absent(),
    required int reference,
    required double amount,
    this.date = const Value.absent(),
  }) : reference = Value(reference),
       amount = Value(amount);
  static Insertable<Reference> custom({
    Expression<int>? referenceID,
    Expression<String>? note,
    Expression<String>? phone,
    Expression<String>? bank,
    Expression<int>? reference,
    Expression<double>? amount,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (referenceID != null) 'reference_i_d': referenceID,
      if (note != null) 'note': note,
      if (phone != null) 'phone': phone,
      if (bank != null) 'bank': bank,
      if (reference != null) 'reference': reference,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
    });
  }

  ReferenceItemCompanion copyWith({
    Value<int>? referenceID,
    Value<String?>? note,
    Value<String?>? phone,
    Value<String?>? bank,
    Value<int>? reference,
    Value<double>? amount,
    Value<DateTime>? date,
  }) {
    return ReferenceItemCompanion(
      referenceID: referenceID ?? this.referenceID,
      note: note ?? this.note,
      phone: phone ?? this.phone,
      bank: bank ?? this.bank,
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
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (bank.present) {
      map['bank'] = Variable<String>(bank.value);
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
          ..write('note: $note, ')
          ..write('phone: $phone, ')
          ..write('bank: $bank, ')
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
      Value<String?> note,
      Value<String?> phone,
      Value<String?> bank,
      required int reference,
      required double amount,
      Value<DateTime> date,
    });
typedef $$ReferenceItemTableUpdateCompanionBuilder =
    ReferenceItemCompanion Function({
      Value<int> referenceID,
      Value<String?> note,
      Value<String?> phone,
      Value<String?> bank,
      Value<int> reference,
      Value<double> amount,
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

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bank => $composableBuilder(
    column: $table.bank,
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

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bank => $composableBuilder(
    column: $table.bank,
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

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get bank =>
      $composableBuilder(column: $table.bank, builder: (column) => column);

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
          Reference,
          $$ReferenceItemTableFilterComposer,
          $$ReferenceItemTableOrderingComposer,
          $$ReferenceItemTableAnnotationComposer,
          $$ReferenceItemTableCreateCompanionBuilder,
          $$ReferenceItemTableUpdateCompanionBuilder,
          (
            Reference,
            BaseReferences<_$AppDatabase, $ReferenceItemTable, Reference>,
          ),
          Reference,
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
                Value<String?> note = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> bank = const Value.absent(),
                Value<int> reference = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
              }) => ReferenceItemCompanion(
                referenceID: referenceID,
                note: note,
                phone: phone,
                bank: bank,
                reference: reference,
                amount: amount,
                date: date,
              ),
          createCompanionCallback:
              ({
                Value<int> referenceID = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> bank = const Value.absent(),
                required int reference,
                required double amount,
                Value<DateTime> date = const Value.absent(),
              }) => ReferenceItemCompanion.insert(
                referenceID: referenceID,
                note: note,
                phone: phone,
                bank: bank,
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
      Reference,
      $$ReferenceItemTableFilterComposer,
      $$ReferenceItemTableOrderingComposer,
      $$ReferenceItemTableAnnotationComposer,
      $$ReferenceItemTableCreateCompanionBuilder,
      $$ReferenceItemTableUpdateCompanionBuilder,
      (
        Reference,
        BaseReferences<_$AppDatabase, $ReferenceItemTable, Reference>,
      ),
      Reference,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ReferenceItemTableTableManager get referenceItem =>
      $$ReferenceItemTableTableManager(_db, _db.referenceItem);
}
