import 'package:flutter/material.dart';

class ReferenceGroupButton extends StatelessWidget {
  final ValueNotifier<Set<int>> selectedFields;

  const ReferenceGroupButton(
    ValueNotifier<Set<int>> this.selectedFields, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SegmentedButton<int>(
        segments: [
          ButtonSegment(
            value: 1,
            icon: Icon(Icons.person),
            label: Text('Nombre'),
          ),
          ButtonSegment(
            value: 2,
            icon: Icon(Icons.phone),
            label: Text('Telefono'),
          ),
        ],
        onSelectionChanged: (newSelection) =>
            selectedFields.value = newSelection,
        selected: selectedFields.value,
        multiSelectionEnabled: true,
        emptySelectionAllowed: true,
      ),
    );
  }
}
