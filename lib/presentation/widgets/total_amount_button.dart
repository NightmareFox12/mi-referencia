import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/domain/reference_provider.dart';
import 'package:mi_referencia/utils/format_amount.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TotalAmountButton extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //watch
    final totalAmountTodayReferenceAsync = ref.watch(totalTodayAmountProvider);
    final totalAmountLastWeekReferenceAsync = ref.watch(
      totalLastWeekAmountProvider,
    );

    //states
    final showToday = useState<bool>(false);

    return Padding(
      padding: const .only(top: 8, bottom: 4),
      child: Column(
        mainAxisSize: .min,
        children: [
          Text(
            showToday.value ? 'Monto Total de Hoy' : "Monto Total de la Semana",
            style: TextStyle(fontSize: 15, fontWeight: .bold),
          ),

          Skeletonizer(
            enabled:
                totalAmountTodayReferenceAsync.isLoading ||
                totalAmountLastWeekReferenceAsync.isLoading,
            enableSwitchAnimation: true,
            child: GestureDetector(
              onTap: () => showToday.value = !showToday.value,
              child: Text(
                showToday.value
                    ? '${formatAmount(totalAmountTodayReferenceAsync.value ?? 0.0)} Bs.F'
                    : '${formatAmount(totalAmountLastWeekReferenceAsync.value ?? 0.0)} Bs.F',
                style: const TextStyle(fontSize: 24, fontWeight: .bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
