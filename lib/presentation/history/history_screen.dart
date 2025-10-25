import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/domain/reference_notifier.dart';

class HistoryScreen extends HookConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //states
    final referencesAsync = ref.watch(referenceProvider);

    //functions
    Future<void> loadReferences() async {
      await ref.read(referenceProvider.notifier).load();
    }

    useEffect(() {
      loadReferences();
      return null;
    }, []);

    return Column(
      children: referencesAsync.when(
        data: (data) => [Text(data.toString())],
        loading: () => [CircularProgressIndicator()],
        error: (error, stackTrace) => [Text(error.toString())],
      ),
    );
  }
}
