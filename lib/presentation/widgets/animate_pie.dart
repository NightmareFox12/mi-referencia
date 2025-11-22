import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/domain/reference_provider.dart';
import 'package:mi_referencia/utils/format_amount.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnimatePie extends HookConsumerWidget {
  final ValueNotifier<int> currentScreen;

  const AnimatePie({super.key, required this.currentScreen});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalAmountReferenceAsync = ref.watch(totalAmountProvider);

    final AnimationController controller = useAnimationController(
      duration: const Duration(seconds: 4),
    );

    final Animation<Color?> animationColor = ColorTween(
      begin: Colors.red,
      end: Colors.blue,
    ).animate(controller);

    final Color animatedColor = useAnimation(animationColor)!;
    useEffect(() {
      controller.repeat(reverse: true);
      return controller.dispose;
    }, const []);

    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 280,
            height: 280,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    color: animatedColor,
                    value: 100,
                    radius: 12,
                    showTitle: false,
                  ),
                ],
              ),
              duration: Duration(milliseconds: 150),
              curve: Curves.linear,
            ),
          ),
        ),

        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Monto Total de Hoy',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),

              Skeletonizer(
                enabled: totalAmountReferenceAsync.isLoading,
                enableSwitchAnimation: true,
                child: Text(
                  '${formatAmount(totalAmountReferenceAsync.value ?? 0.0)} Bs.F',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),

        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: TextButton.icon(
              onPressed: () => currentScreen.value = 1,
              icon: Icon(Icons.remove_red_eye),
              label: Text('Ver Referencias'),
            ),
          ),
        ),
      ],
    );
  }
}
