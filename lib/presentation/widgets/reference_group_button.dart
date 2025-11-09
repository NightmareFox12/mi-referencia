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
    //functions
    handleChange(Set<int> newSelection) async {
      final List<String> res = newSelection
          .map((data) => data.toString())
          .toList();

      await SharedPreferencesService().setSelectedFields(res);
      selectedFields.value = newSelection;
    }

    return Center(
      child: SegmentedButton<int>(
        segments: [
          ButtonSegment(
            value: 1,
            icon: Icon(Icons.notes_sharp),
            label: Text('Nota'),
          ),
          ButtonSegment(
            value: 2,
            icon: Icon(Icons.phone),
            label: Text('Telefono'),
          ),
          ButtonSegment(
            value: 3,
            icon: Icon(Icons.account_balance),
            label: Text('Banco'),
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
