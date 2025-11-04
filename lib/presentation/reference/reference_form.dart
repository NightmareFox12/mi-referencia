import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ReferenceForm extends HookWidget {
  const ReferenceForm({super.key});

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
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Center(
                child: SegmentedButton<int>(
                  segments: [
                    ButtonSegment(
                      value: 1,
                      icon: Icon(Icons.phone),
                      label: Text('Telefono'),
                    ),
                    ButtonSegment(
                      value: 2,
                      icon: Icon(Icons.person),
                      label: Text('Nombre'),
                    ),
                    ButtonSegment(
                      value: 3,
                      icon: Icon(Icons.widgets),
                      label: Text('Todo'),
                    ),
                  ],
                  onSelectionChanged: (newSelection) =>
                      selectedFields.value = newSelection,
                  selected: selectedFields.value,
                  multiSelectionEnabled: true,
                  emptySelectionAllowed: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
