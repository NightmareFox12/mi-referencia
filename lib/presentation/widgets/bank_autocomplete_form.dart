import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/data/database/database.dart';
import 'package:mi_referencia/domain/bank_provider.dart';

class BankAutocompleteForm extends HookConsumerWidget {
  final ValueNotifier<int?> bankID;
  const BankAutocompleteForm({super.key, required this.bankID});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bankList = ref.watch(bankProvider).value ?? [];

    //states
    final msgError = useState<String?>(null);

    //functions
    String? showError(String currentText) {
      if (currentText.isEmpty) return null;
      final isValidName = bankList.any(
        (bank) => '${bank.code} - ${bank.name}' == currentText,
      );
      if (!isValidName)
        return 'El banco no es válido o no ha sido seleccionado.';
      return null;
    }

    useEffect(() {
      return null;
    }, [bankID.value]);

    return Autocomplete<Bank>(
      displayStringForOption: (Bank option) =>
          '${option.code} - ${option.name}',

      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<Bank>.empty();
        }
        return bankList.where((Bank bank) {
          final bankDisplay = '${bank.code} - ${bank.name}'.toUpperCase();
          return bankDisplay.contains(textEditingValue.text.toUpperCase());
        });
      },

      fieldViewBuilder:
          (
            BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) {
            textEditingController.addListener(
              () => msgError.value = showError(textEditingController.text),
            );

            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              forceErrorText: msgError.value,
              decoration: const InputDecoration(
                icon: Icon(Icons.account_balance),
                labelText: 'Banco *',
                hintText: 'Escribe el nombre del banco',
                border: OutlineInputBorder(),
              ),
            );
          },

      optionsViewBuilder:
          (
            BuildContext context,
            AutocompleteOnSelected<Bank> onSelected,
            Iterable<Bank> options,
          ) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 4.0,
                child: SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Bank option = options.elementAt(index);
                      return ListTile(
                        title: Text('${option.code} - ${option.name}'),
                        onTap: () => onSelected(option),
                      );
                    },
                  ),
                ),
              ),
            );
          },

      onSelected: (Bank selection) {
        bankID.value = selection.bankID;
        msgError.value = null;
      },
    );
  }
}
