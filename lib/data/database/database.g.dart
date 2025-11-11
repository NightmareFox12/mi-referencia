// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BankItemTable extends BankItem with TableInfo<$BankItemTable, Bank> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BankItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _bankIDMeta = const VerificationMeta('bankID');
  @override
  late final GeneratedColumn<int> bankID = GeneratedColumn<int>(
    'bank_i_d',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<int> code = GeneratedColumn<int>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [bankID, code, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bank_item';
  @override
  VerificationContext validateIntegrity(
    Insertable<Bank> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('bank_i_d')) {
      context.handle(
        _bankIDMeta,
        bankID.isAcceptableOrUnknown(data['bank_i_d']!, _bankIDMeta),
      );
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {bankID};
  @override
  Bank map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Bank(
      bankID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bank_i_d'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $BankItemTable createAlias(String alias) {
    return $BankItemTable(attachedDatabase, alias);
  }
}

class Bank extends DataClass implements Insertable<Bank> {
  final int bankID;
  final int code;
  final String name;
  const Bank({required this.bankID, required this.code, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['bank_i_d'] = Variable<int>(bankID);
    map['code'] = Variable<int>(code);
    map['name'] = Variable<String>(name);
    return map;
  }

  BankItemCompanion toCompanion(bool nullToAbsent) {
    return BankItemCompanion(
      bankID: Value(bankID),
      code: Value(code),
      name: Value(name),
    );
  }

  factory Bank.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Bank(
      bankID: serializer.fromJson<int>(json['bankID']),
      code: serializer.fromJson<int>(json['code']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bankID': serializer.toJson<int>(bankID),
      'code': serializer.toJson<int>(code),
      'name': serializer.toJson<String>(name),
    };
  }

  Bank copyWith({int? bankID, int? code, String? name}) => Bank(
    bankID: bankID ?? this.bankID,
    code: code ?? this.code,
    name: name ?? this.name,
  );
  Bank copyWithCompanion(BankItemCompanion data) {
    return Bank(
      bankID: data.bankID.present ? data.bankID.value : this.bankID,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Bank(')
          ..write('bankID: $bankID, ')
          ..write('code: $code, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(bankID, code, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Bank &&
          other.bankID == this.bankID &&
          other.code == this.code &&
          other.name == this.name);
}

class BankItemCompanion extends UpdateCompanion<Bank> {
  final Value<int> bankID;
  final Value<int> code;
  final Value<String> name;
  const BankItemCompanion({
    this.bankID = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
  });
  BankItemCompanion.insert({
    this.bankID = const Value.absent(),
    required int code,
    required String name,
  }) : code = Value(code),
       name = Value(name);
  static Insertable<Bank> custom({
    Expression<int>? bankID,
    Expression<int>? code,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (bankID != null) 'bank_i_d': bankID,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
    });
  }

  BankItemCompanion copyWith({
    Value<int>? bankID,
    Value<int>? code,
    Value<String>? name,
  }) {
    return BankItemCompanion(
      bankID: bankID ?? this.bankID,
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bankID.present) {
      map['bank_i_d'] = Variable<int>(bankID.value);
    }
    if (code.present) {
      map['code'] = Variable<int>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankItemCompanion(')
          ..write('bankID: $bankID, ')
          ..write('code: $code, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

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
  static const VerificationMeta _bankIDMeta = const VerificationMeta('bankID');
  @override
  late final GeneratedColumn<int> bankID = GeneratedColumn<int>(
    'bank_i_d',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES bank_item (bank_i_d)',
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
    bankID,
    note,
    phone,
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
    if (data.containsKey('bank_i_d')) {
      context.handle(
        _bankIDMeta,
        bankID.isAcceptableOrUnknown(data['bank_i_d']!, _bankIDMeta),
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
      bankID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bank_i_d'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
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
  final int? bankID;
  final String? note;
  final String? phone;
  final int reference;
  final double amount;
  final DateTime date;
  const Reference({
    required this.referenceID,
    this.bankID,
    this.note,
    this.phone,
    required this.reference,
    required this.amount,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['reference_i_d'] = Variable<int>(referenceID);
    if (!nullToAbsent || bankID != null) {
      map['bank_i_d'] = Variable<int>(bankID);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['reference'] = Variable<int>(reference);
    map['amount'] = Variable<double>(amount);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  ReferenceItemCompanion toCompanion(bool nullToAbsent) {
    return ReferenceItemCompanion(
      referenceID: Value(referenceID),
      bankID: bankID == null && nullToAbsent
          ? const Value.absent()
          : Value(bankID),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
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
      bankID: serializer.fromJson<int?>(json['bankID']),
      note: serializer.fromJson<String?>(json['note']),
      phone: serializer.fromJson<String?>(json['phone']),
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
      'bankID': serializer.toJson<int?>(bankID),
      'note': serializer.toJson<String?>(note),
      'phone': serializer.toJson<String?>(phone),
      'reference': serializer.toJson<int>(reference),
      'amount': serializer.toJson<double>(amount),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Reference copyWith({
    int? referenceID,
    Value<int?> bankID = const Value.absent(),
    Value<String?> note = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    int? reference,
    double? amount,
    DateTime? date,
  }) => Reference(
    referenceID: referenceID ?? this.referenceID,
    bankID: bankID.present ? bankID.value : this.bankID,
    note: note.present ? note.value : this.note,
    phone: phone.present ? phone.value : this.phone,
    reference: reference ?? this.reference,
    amount: amount ?? this.amount,
    date: date ?? this.date,
  );
  Reference copyWithCompanion(ReferenceItemCompanion data) {
    return Reference(
      referenceID: data.referenceID.present
          ? data.referenceID.value
          : this.referenceID,
      bankID: data.bankID.present ? data.bankID.value : this.bankID,
      note: data.note.present ? data.note.value : this.note,
      phone: data.phone.present ? data.phone.value : this.phone,
      reference: data.reference.present ? data.reference.value : this.reference,
      amount: data.amount.present ? data.amount.value : this.amount,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reference(')
          ..write('referenceID: $referenceID, ')
          ..write('bankID: $bankID, ')
          ..write('note: $note, ')
          ..write('phone: $phone, ')
          ..write('reference: $reference, ')
          ..write('amount: $amount, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(referenceID, bankID, note, phone, reference, amount, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reference &&
          other.referenceID == this.referenceID &&
          other.bankID == this.bankID &&
          other.note == this.note &&
          other.phone == this.phone &&
          other.reference == this.reference &&
          other.amount == this.amount &&
          other.date == this.date);
}

class ReferenceItemCompanion extends UpdateCompanion<Reference> {
  final Value<int> referenceID;
  final Value<int?> bankID;
  final Value<String?> note;
  final Value<String?> phone;
  final Value<int> reference;
  final Value<double> amount;
  final Value<DateTime> date;
  const ReferenceItemCompanion({
    this.referenceID = const Value.absent(),
    this.bankID = const Value.absent(),
    this.note = const Value.absent(),
    this.phone = const Value.absent(),
    this.reference = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
  });
  ReferenceItemCompanion.insert({
    this.referenceID = const Value.absent(),
    this.bankID = const Value.absent(),
    this.note = const Value.absent(),
    this.phone = const Value.absent(),
    required int reference,
    required double amount,
    this.date = const Value.absent(),
  }) : reference = Value(reference),
       amount = Value(amount);
  static Insertable<Reference> custom({
    Expression<int>? referenceID,
    Expression<int>? bankID,
    Expression<String>? note,
    Expression<String>? phone,
    Expression<int>? reference,
    Expression<double>? amount,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (referenceID != null) 'reference_i_d': referenceID,
      if (bankID != null) 'bank_i_d': bankID,
      if (note != null) 'note': note,
      if (phone != null) 'phone': phone,
      if (reference != null) 'reference': reference,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
    });
  }

  ReferenceItemCompanion copyWith({
    Value<int>? referenceID,
    Value<int?>? bankID,
    Value<String?>? note,
    Value<String?>? phone,
    Value<int>? reference,
    Value<double>? amount,
    Value<DateTime>? date,
  }) {
    return ReferenceItemCompanion(
      referenceID: referenceID ?? this.referenceID,
      bankID: bankID ?? this.bankID,
      note: note ?? this.note,
      phone: phone ?? this.phone,
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
    if (bankID.present) {
      map['bank_i_d'] = Variable<int>(bankID.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
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
          ..write('bankID: $bankID, ')
          ..write('note: $note, ')
          ..write('phone: $phone, ')
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
  late final $BankItemTable bankItem = $BankItemTable(this);
  late final $ReferenceItemTable referenceItem = $ReferenceItemTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bankItem, referenceItem];
}

typedef $$BankItemTableCreateCompanionBuilder =
    BankItemCompanion Function({
      Value<int> bankID,
      required int code,
      required String name,
    });
typedef $$BankItemTableUpdateCompanionBuilder =
    BankItemCompanion Function({
      Value<int> bankID,
      Value<int> code,
      Value<String> name,
    });

final class $$BankItemTableReferences
    extends BaseReferences<_$AppDatabase, $BankItemTable, Bank> {
  $$BankItemTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ReferenceItemTable, List<Reference>>
  _referenceItemRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.referenceItem,
    aliasName: $_aliasNameGenerator(
      db.bankItem.bankID,
      db.referenceItem.bankID,
    ),
  );

  $$ReferenceItemTableProcessedTableManager get referenceItemRefs {
    final manager = $$ReferenceItemTableTableManager(
      $_db,
      $_db.referenceItem,
    ).filter((f) => f.bankID.bankID.sqlEquals($_itemColumn<int>('bank_i_d')!));

    final cache = $_typedResult.readTableOrNull(_referenceItemRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BankItemTableFilterComposer
    extends Composer<_$AppDatabase, $BankItemTable> {
  $$BankItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get bankID => $composableBuilder(
    column: $table.bankID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> referenceItemRefs(
    Expression<bool> Function($$ReferenceItemTableFilterComposer f) f,
  ) {
    final $$ReferenceItemTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bankID,
      referencedTable: $db.referenceItem,
      getReferencedColumn: (t) => t.bankID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReferenceItemTableFilterComposer(
            $db: $db,
            $table: $db.referenceItem,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BankItemTableOrderingComposer
    extends Composer<_$AppDatabase, $BankItemTable> {
  $$BankItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get bankID => $composableBuilder(
    column: $table.bankID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BankItemTableAnnotationComposer
    extends Composer<_$AppDatabase, $BankItemTable> {
  $$BankItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get bankID =>
      $composableBuilder(column: $table.bankID, builder: (column) => column);

  GeneratedColumn<int> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> referenceItemRefs<T extends Object>(
    Expression<T> Function($$ReferenceItemTableAnnotationComposer a) f,
  ) {
    final $$ReferenceItemTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bankID,
      referencedTable: $db.referenceItem,
      getReferencedColumn: (t) => t.bankID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReferenceItemTableAnnotationComposer(
            $db: $db,
            $table: $db.referenceItem,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BankItemTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BankItemTable,
          Bank,
          $$BankItemTableFilterComposer,
          $$BankItemTableOrderingComposer,
          $$BankItemTableAnnotationComposer,
          $$BankItemTableCreateCompanionBuilder,
          $$BankItemTableUpdateCompanionBuilder,
          (Bank, $$BankItemTableReferences),
          Bank,
          PrefetchHooks Function({bool referenceItemRefs})
        > {
  $$BankItemTableTableManager(_$AppDatabase db, $BankItemTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BankItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BankItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BankItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> bankID = const Value.absent(),
                Value<int> code = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => BankItemCompanion(bankID: bankID, code: code, name: name),
          createCompanionCallback:
              ({
                Value<int> bankID = const Value.absent(),
                required int code,
                required String name,
              }) => BankItemCompanion.insert(
                bankID: bankID,
                code: code,
                name: name,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BankItemTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({referenceItemRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (referenceItemRefs) db.referenceItem,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (referenceItemRefs)
                    await $_getPrefetchedData<Bank, $BankItemTable, Reference>(
                      currentTable: table,
                      referencedTable: $$BankItemTableReferences
                          ._referenceItemRefsTable(db),
                      managerFromTypedResult: (p0) => $$BankItemTableReferences(
                        db,
                        table,
                        p0,
                      ).referenceItemRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.bankID == item.bankID),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BankItemTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BankItemTable,
      Bank,
      $$BankItemTableFilterComposer,
      $$BankItemTableOrderingComposer,
      $$BankItemTableAnnotationComposer,
      $$BankItemTableCreateCompanionBuilder,
      $$BankItemTableUpdateCompanionBuilder,
      (Bank, $$BankItemTableReferences),
      Bank,
      PrefetchHooks Function({bool referenceItemRefs})
    >;
typedef $$ReferenceItemTableCreateCompanionBuilder =
    ReferenceItemCompanion Function({
      Value<int> referenceID,
      Value<int?> bankID,
      Value<String?> note,
      Value<String?> phone,
      required int reference,
      required double amount,
      Value<DateTime> date,
    });
typedef $$ReferenceItemTableUpdateCompanionBuilder =
    ReferenceItemCompanion Function({
      Value<int> referenceID,
      Value<int?> bankID,
      Value<String?> note,
      Value<String?> phone,
      Value<int> reference,
      Value<double> amount,
      Value<DateTime> date,
    });

final class $$ReferenceItemTableReferences
    extends BaseReferences<_$AppDatabase, $ReferenceItemTable, Reference> {
  $$ReferenceItemTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BankItemTable _bankIDTable(_$AppDatabase db) =>
      db.bankItem.createAlias(
        $_aliasNameGenerator(db.referenceItem.bankID, db.bankItem.bankID),
      );

  $$BankItemTableProcessedTableManager? get bankID {
    final $_column = $_itemColumn<int>('bank_i_d');
    if ($_column == null) return null;
    final manager = $$BankItemTableTableManager(
      $_db,
      $_db.bankItem,
    ).filter((f) => f.bankID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bankIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

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

  $$BankItemTableFilterComposer get bankID {
    final $$BankItemTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bankID,
      referencedTable: $db.bankItem,
      getReferencedColumn: (t) => t.bankID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BankItemTableFilterComposer(
            $db: $db,
            $table: $db.bankItem,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  $$BankItemTableOrderingComposer get bankID {
    final $$BankItemTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bankID,
      referencedTable: $db.bankItem,
      getReferencedColumn: (t) => t.bankID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BankItemTableOrderingComposer(
            $db: $db,
            $table: $db.bankItem,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  GeneratedColumn<int> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$BankItemTableAnnotationComposer get bankID {
    final $$BankItemTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bankID,
      referencedTable: $db.bankItem,
      getReferencedColumn: (t) => t.bankID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BankItemTableAnnotationComposer(
            $db: $db,
            $table: $db.bankItem,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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
          (Reference, $$ReferenceItemTableReferences),
          Reference,
          PrefetchHooks Function({bool bankID})
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
                Value<int?> bankID = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<int> reference = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
              }) => ReferenceItemCompanion(
                referenceID: referenceID,
                bankID: bankID,
                note: note,
                phone: phone,
                reference: reference,
                amount: amount,
                date: date,
              ),
          createCompanionCallback:
              ({
                Value<int> referenceID = const Value.absent(),
                Value<int?> bankID = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                required int reference,
                required double amount,
                Value<DateTime> date = const Value.absent(),
              }) => ReferenceItemCompanion.insert(
                referenceID: referenceID,
                bankID: bankID,
                note: note,
                phone: phone,
                reference: reference,
                amount: amount,
                date: date,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReferenceItemTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({bankID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (bankID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.bankID,
                                referencedTable: $$ReferenceItemTableReferences
                                    ._bankIDTable(db),
                                referencedColumn: $$ReferenceItemTableReferences
                                    ._bankIDTable(db)
                                    .bankID,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
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
      (Reference, $$ReferenceItemTableReferences),
      Reference,
      PrefetchHooks Function({bool bankID})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BankItemTableTableManager get bankItem =>
      $$BankItemTableTableManager(_db, _db.bankItem);
  $$ReferenceItemTableTableManager get referenceItem =>
      $$ReferenceItemTableTableManager(_db, _db.referenceItem);
}
