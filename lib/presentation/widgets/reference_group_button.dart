import 'package:flutter/material.dart';
import 'package:mi_referencia/storage/shared_preferences_service.dart';

class ReferenceGroupButton extends StatelessWidget {
  final ValueNotifier<Set<int>> selectedFields;

  const ReferenceGroupButton(
    ValueNotifier<Set<int>> this.selectedFields, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    handleChange(Set<int> newSelection) async {
      selectedFields.value = selectedFields.value;

      final result = newSelection.map((data) => data.toString());

      print(result);
      await SharedPreferencesService().setSelectedFields();
    }

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
        onSelectionChanged: (newSelection) => handleChange(newSelection),
        selected: selectedFields.value,
        multiSelectionEnabled: true,
        emptySelectionAllowed: true,
      ),
    );
  }
}
