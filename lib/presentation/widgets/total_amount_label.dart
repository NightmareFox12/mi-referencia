import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/domain/reference_provider.dart';
import 'package:mi_referencia/utils/format_amount.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TotalAmountLabel extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalAmountReferenceAsync = ref.watch(totalAmountProvider);

    return Padding(
      padding: const .only(top: 8, bottom: 4),
      child: Column(
        mainAxisSize: .min,
        children: [
          Text(
            'Monto Total de Hoy',
            style: TextStyle(fontSize: 15, fontWeight: .bold),
          ),

          Skeletonizer(
            enabled: totalAmountReferenceAsync.isLoading,
            enableSwitchAnimation: true,
            child: Text(
              '${formatAmount(totalAmountReferenceAsync.value ?? 0.0)} Bs.F',
              style: const TextStyle(fontSize: 24, fontWeight: .bold),
            ),
          ),
        ],
      ),
    );
  }
}
