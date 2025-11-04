import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ReferenceForm extends HookWidget {
  final ValueNotifier<Set<int>> selectedFields;

  const ReferenceForm(ValueNotifier<Set<int>> this.selectedFields, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          padding: const EdgeInsets.only(top: 16),
          children: [
            // Name
            selectedFields.value.contains(1)
                ? TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'What do people call you?',
                      labelText: 'Nombre *',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                      return (value != null && value.contains('@'))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                  )
                : SizedBox.shrink(),
            SizedBox(height: 24),

            //Phone
            selectedFields.value.contains(2)
                ? TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'What do people call you?',
                      labelText: 'Télefono *',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                      return (value != null && value.contains('@'))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                  )
                : SizedBox.shrink(),
            selectedFields.value.contains(2)
                ? SizedBox(height: 24)
                : SizedBox.shrink(),

            //Reference
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What do people call you?',
                labelText: 'Referencia *',
                border: OutlineInputBorder(),
              ),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
            ),
            SizedBox(height: 24),

            //Amount
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What do people call you?',
                labelText: 'Monto *',
                border: OutlineInputBorder(),
              ),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
