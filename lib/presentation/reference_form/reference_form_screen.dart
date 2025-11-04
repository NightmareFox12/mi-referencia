import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mi_referencia/presentation/widgets/reference_form.dart';
import 'package:mi_referencia/presentation/widgets/reference_group_button.dart';

class ReferenceFormScreen extends HookWidget {
  const ReferenceFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final _formKey = useMemoized(() => GlobalKey<FormState>());
    final selectedFields = useState<Set<int>>({1});

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Crear Referencia'),
          leading: BackButton(onPressed: () => Navigator.pop(context)),
        ),
        body: Column(
          children: [
            ReferenceGroupButton(selectedFields),

            ReferenceForm(selectedFields),
          ],
        ),
      ),
    );
  }
}
