import 'package:flutter/material.dart';

class BankAutocompleteForm extends StatelessWidget {
  const BankAutocompleteForm({super.key});

  // Lista de bancos (debería estar fuera del build en un widget Stateful o Service)
  static const List<String> _bankOptions = <String>[
    '0102 - Banco de Venezuela',
    'Banco Provincial',
    'Banco Mercantil',
    'Banco Banesco',
    'Banco Occidental de Descuento (BOD)',
    'Banco Nacional de Crédito',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      // 1. Opciones que se muestran
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          // Si el campo está vacío, no mostrar ninguna sugerencia
          return const Iterable<String>.empty();
        }
        // De lo contrario, devuelve las opciones que contengan el texto escrito
        return _bankOptions.where((String option) {
          // Usamos toLowerCase() para que la búsqueda no distinga mayúsculas/minúsculas
          return option.toLowerCase().contains(
            textEditingValue.text.toLowerCase(),
          );
        });
      },

      // 2. Cómo construir el campo de texto (Tu TextFormField)
      fieldViewBuilder:
          (
            BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) {
            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              onFieldSubmitted: (String value) {
                onFieldSubmitted();
              },
              // Decoración y validadores que tenías
              decoration: const InputDecoration(
                icon: Icon(Icons.account_balance),
                labelText: 'Banco *',
                hintText: 'Escribe el nombre del banco',
                border: OutlineInputBorder(),
              ),
              validator: (String? value) {
                // Tu lógica de validación
                return (value != null && value.length < 5)
                    ? 'El nombre es muy corto.'
                    : null;
              },
            );
          },

      // 3. Cómo construir cada sugerencia en la lista desplegable
      optionsViewBuilder:
          (
            BuildContext context,
            AutocompleteOnSelected<String> onSelected,
            Iterable<String> options,
          ) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 4.0,
                child: SizedBox(
                  height: 200.0, // Altura máxima para el menú desplegable
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String option = options.elementAt(index);
                      return ListTile(
                        title: Text(option),
                        onTap: () {
                          onSelected(
                            option,
                          ); // Esto selecciona la opción y la pone en el campo
                        },
                      );
                    },
                  ),
                ),
              ),
            );
          },

      // 4. Qué hacer cuando se selecciona una opción
      onSelected: (String selection) {
        print('Banco seleccionado: $selection');
        // Aquí puedes guardar el valor en tu formulario o variable
      },
    );
  }
}
