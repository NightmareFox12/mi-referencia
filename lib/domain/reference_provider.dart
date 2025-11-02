import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_referencia/data/database/database.dart';
import 'package:mi_referencia/data/datasources/data_source.dart';

class ReferenceProvider extends AsyncNotifier<List<Reference>> {
  @override
  Future<List<Reference>> build() async {
    final db = AppDatabase();
    final data = await ReferenceDataSource(db).getAllReferences();

    return data;
  }

  // Future<void> load() async {
  //   final db = AppDatabase();
  //   final data = await ReferenceDataSource(db).getAllReferences();

  //   state = AsyncValue.data(data);
  // }
}

final referenceProvider =
    AsyncNotifierProvider<ReferenceProvider, List<Reference>>(
      ReferenceProvider.new,
    );

class AmountTotalNotifier extends AsyncNotifier<double> {
  @override
  Future<double> build() async {
    final db = AppDatabase();
    return await ReferenceDataSource(db).getAmountTotalReference();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final db = AppDatabase();
    final total = await ReferenceDataSource(db).getAmountTotalReference();
    state = AsyncValue.data(total);
  }
}

final amountTotalProvider = AsyncNotifierProvider<AmountTotalNotifier, double>(
  AmountTotalNotifier.new,
);
