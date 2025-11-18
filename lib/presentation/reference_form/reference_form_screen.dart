import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/domain/reference_provider.dart';
import 'package:mi_referencia/presentation/widgets/bank_autocomplete_form.dart';
import 'package:mi_referencia/presentation/widgets/reference_group_button.dart';
import 'package:mi_referencia/storage/shared_preferences_service.dart';
import 'package:mi_referencia/utils/format_amount.dart';

class ReferenceFormScreen extends HookConsumerWidget {
  const ReferenceFormScreen({super.key});

  //consts
  static const List<String> PLACEHOLDER_TEXT = ['Verduras', 'Copia', 'Granos'];

  static final String randomNotePlaceholder =
      PLACEHOLDER_TEXT[Random().nextInt(PLACEHOLDER_TEXT.length)];

  //controllers
  static final noteController = TextEditingController();
  static final phoneController = TextEditingController();
  static final referenceController = TextEditingController();
  static final amountController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //states
    final selectedFields = useState<Set<int>>({1});
    final note = useState<String>('');
    final phone = useState<String>('');
    final bankID = useState<int?>(null);
    final reference = useState<String>('');
    final amount = useState<String>('');

    //input formatters
    final TextInputFormatter phoneFormatter = TextInputFormatter.withFunction((
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

    final TextInputFormatter amountFormatter = TextInputFormatter.withFunction((
      oldValue,
      newValue,
    ) {
      const int maxDigits = 10;
      const double maxValue = 999999999.0;

      String cleanText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

      if (cleanText.length > maxDigits) return oldValue;

      if (cleanText.isEmpty) {
        return const TextEditingValue(
          text: '',
          selection: TextSelection.collapsed(offset: 0),
        );
      }

      double? parsedAmount = double.tryParse(cleanText);

      if (parsedAmount == null) return oldValue;
      if (parsedAmount > maxValue) return oldValue;

      String formatted = formatAmount(parsedAmount);
      int offset = formatted.length;

      return TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: offset),
      );
    });

    //error msg
    String? errorNoteMsg() {
      final value = note.value;

      if (value.isEmpty) return null;
      if (value.length < 2) return 'La nota es muy corta.';
      if (value.length > 50) return 'La nota es muy largo.';

      // if (RegExp(r'[0-9]').hasMatch(value))
      // return 'El nombre no debe contener números.';

      // if (RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-+=/\\\[\]]').hasMatch(value))
      // return 'El nombre no debe contener caracteres especiales.';

      return null;
    }

    String? errorPhoneMsg() {
      if (phone.value.isEmpty) return null;
      if (phone.value.length != 12) return 'El teléfono es inválido.';

      if (RegExp(r'[a-zA-Z]').hasMatch(phone.value))
        return 'El teléfono es inválido.';

      return null;
    }

    String? errorReferenceMsg() {
      final msg = "La referencia no es válida.";

      if (reference.value.isEmpty) return null;

      final regExp = RegExp(r'^\d{4}$');
      if (regExp.hasMatch(reference.value))
        return null;
      else
        return msg;
    }

    //functions
    bool isEmptyFields() {
      return note.value.isEmpty &&
          phone.value.isEmpty &&
          bankID.value == null &&
          reference.value.isEmpty &&
          amount.value.isEmpty;
    }

    void clearForm() {
      note.value = '';
      phone.value = '';
      reference.value = '';
      amount.value = '';

      noteController.clear();
      phoneController.clear();
      referenceController.clear();
      amountController.clear();
    }

    bool enableButton() {
      //Required
      if (errorReferenceMsg() != null || reference.value.isEmpty) return false;
      if (amount.value.isEmpty) return false;

      //Optional
      if (selectedFields.value.contains(1)) {
        if (errorNoteMsg() != null || note.value.length < 2) return false;
      }

      if (selectedFields.value.contains(2)) {
        if (errorPhoneMsg() != null || phone.value.length < 12) return false;
      }

      if (selectedFields.value.contains(3) && bankID.value == null)
        return false;

      return true;
    }

    Future<void> handleSubmitReference() async {
      final selectedField = selectedFields.value;

      ref
          .read(referenceProvider.notifier)
          .addReference(
            selectedField.contains(1) ? note.value : null,
            selectedField.contains(2) ? phone.value : null,
            selectedField.contains(3) ? bankID.value : null,
            int.parse(reference.value),
            parseAmount(amount.value),
          );
      clearForm();
    }

    //effects
    useEffect(() {
      getData() async {
        final List<String> data = await SharedPreferencesService()
            .getSelectedFields();
        selectedFields.value = data.map((e) => int.parse(e)).toSet();
      }

      getData();
      return null;
    }, []);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Crear Referencia'),
          leading: IconButton(
            tooltip: 'Volver',
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            ReferenceGroupButton(selectedFields),

            // ReferenceForm(selectedFields),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView(
                  padding: const EdgeInsets.only(top: 14, left: 4, right: 4),
                  children: [
                    // Note
                    selectedFields.value.contains(1)
                        ? TextFormField(
                            keyboardType: TextInputType.name,
                            autofocus: true,
                            forceErrorText: errorNoteMsg(),
                            controller: noteController,
                            minLines: 1,
                            maxLines: 4,
                            decoration: InputDecoration(
                              icon: Icon(Icons.notes_outlined),
                              hintText: 'Ej. $randomNotePlaceholder',
                              labelText: 'Nota *',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (String value) => note.value = value,
                            buildCounter:
                                (
                                  context, {
                                  required currentLength,
                                  required isFocused,
                                  required maxLength,
                                }) => null,
                            maxLength: 50,
                          )
                        : SizedBox.shrink(),
                    SizedBox(height: 24),

                    //Phone
                    selectedFields.value.contains(2)
                        ? TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            forceErrorText: errorPhoneMsg(),
                            inputFormatters: [phoneFormatter],
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
                        ? BankAutocompleteForm(bankID: bankID)
                        : SizedBox.shrink(),
                    selectedFields.value.contains(3)
                        ? SizedBox(height: 24)
                        : SizedBox.shrink(),

                    //Reference
                    TextFormField(
                      controller: referenceController,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: false,
                        signed: false,
                      ),
                      forceErrorText: errorReferenceMsg(),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        icon: Icon(Icons.pin),
                        hintText: 'Ej. 2294',
                        labelText: 'Referencia *',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => reference.value = value,
                      maxLength: 4,
                    ),
                    SizedBox(height: 10),

                    //Amount
                    TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                        signed: false,
                      ),
                      inputFormatters: [amountFormatter],
                      decoration: const InputDecoration(
                        icon: Icon(Icons.attach_money),
                        hintText: 'Ej. 100,00',
                        labelText: 'Monto *',
                        border: OutlineInputBorder(),
                        suffixText: 'Bs.F',
                      ),
                      onChanged: (value) => amount.value = value,
                    ),
                    SizedBox(height: 30),

                    Row(
                      spacing: 5,
                      children: [
                        Tooltip(
                          message: 'Limpiar todos los campos',
                          verticalOffset: -55.0,
                          child: IconButton.filled(
                            onPressed: isEmptyFields()
                                ? null
                                : () => clearForm(),
                            icon: Icon(Icons.delete),
                          ),
                        ),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: enableButton()
                                ? () => handleSubmitReference()
                                : null,
                            icon: Icon(Icons.checklist_outlined),
                            label: Text('Guardar Referencia'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
