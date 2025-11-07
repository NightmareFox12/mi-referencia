import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mi_referencia/presentation/widgets/bank_autocomplete_form.dart';

class ReferenceForm extends HookWidget {
  final ValueNotifier<Set<int>> selectedFields;

  const ReferenceForm(ValueNotifier<Set<int>> this.selectedFields, {super.key});

  @override
  Widget build(BuildContext context) {
    //states
    final name = useState<String>('');
    final phone = useState<String>('');
    final bank = useState<String>('');
    final reference = useState<String>('');
    final amount = useState<String>('');

    //input formatters
    final phoneFormatter = TextInputFormatter.withFunction((
      oldValue,
      newValue,
    ) {
      String digits = newValue.text.replaceAll(RegExp(r'\D'), '');

      if (digits.length <= 4) {
        return TextEditingValue(
          text: digits,
          selection: TextSelection.collapsed(offset: digits.length),
        );
      }

      String formatted = digits.substring(0, 4) + '-' + digits.substring(4);
      int offset = formatted.length;

      return TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: offset),
      );
    });

    String? errorNameMsg() {
      final value = name.value;

      if (value.isEmpty) return null;
      if (value.length < 2) return 'El nombre es muy corto.';
      if (value.length > 24) return 'El nombre es muy largo.';

      if (RegExp(r'[0-9]').hasMatch(value))
        return 'El nombre no debe contener números.';

      if (RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-+=/\\\[\]]').hasMatch(value)) {
        return 'El nombre no debe contener caracteres especiales.';
      }

      return null;
    }

    String? errorPhoneMsg() {
      if (phone.value.isEmpty) return null;
    }

    String? errorReferenceMsg() {
      if (reference.value.isEmpty) return null;
      final referenceCheck = int.tryParse(reference.value);
      if (referenceCheck == null) return 'La referencia no es válida.';
      if (referenceCheck > 9999 || referenceCheck < 1000)
        return 'La referencia no es válida.';
      else
        return null;
    }

    handleSubmitReference() async {
      print("cheevere");
    }

    enableButton() {
      if (errorReferenceMsg() == null && reference.value.isNotEmpty)
        return true;
      else
        return false;
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          padding: const EdgeInsets.only(top: 14),
          children: [
            // Name
            selectedFields.value.contains(1)
                ? TextFormField(
                    keyboardType: TextInputType.name,
                    autofocus: true,
                    forceErrorText: errorNameMsg(),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'What do people call you?',
                      labelText: 'Nombre *',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String value) => name.value = value,
                    validator: (String? value) {
                      return (value != null && value.contains('@'))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                    buildCounter:
                        (
                          context, {
                          required currentLength,
                          required isFocused,
                          required maxLength,
                        }) => null,
                    maxLength: 24,
                  )
                : SizedBox.shrink(),
            SizedBox(height: 24),

            //Phone
            selectedFields.value.contains(2)
                ? TextFormField(
                    keyboardType: TextInputType.phone,
                    forceErrorText: errorPhoneMsg(),
                    inputFormatters: [
                      phoneFormatter,
                      // FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      icon: Icon(Icons.phone),
                      hintText: '0412-1234567',
                      labelText: 'Télefono *',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String value) => phone.value = value,
                    buildCounter:
                        (
                          context, {
                          required currentLength,
                          required isFocused,
                          required maxLength,
                        }) => null,
                    maxLength: 12,
                  )
                : SizedBox.shrink(),
            selectedFields.value.contains(2)
                ? SizedBox(height: 24)
                : SizedBox.shrink(),

            //Bank
            selectedFields.value.contains(3)
                ? BankAutocompleteForm()
                : SizedBox.shrink(),

            selectedFields.value.contains(3)
                ? SizedBox(height: 24)
                : SizedBox.shrink(),

            //Reference
            TextFormField(
              keyboardType: TextInputType.numberWithOptions(
                decimal: false,
                signed: false,
              ),
              forceErrorText: errorReferenceMsg(),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                icon: Icon(Icons.pin),
                hintText: '2294',
                labelText: 'Referencia *',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => reference.value = value,
              maxLength: 4,
            ),
            SizedBox(height: 24),

            //Amount
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.attach_money),
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
            SizedBox(height: 30),

            FilledButton(
              onPressed: enableButton() ? () => handleSubmitReference() : null,
              child: Text('Crear'),
            ),
          ],
        ),
      ),
    );
  }
}
