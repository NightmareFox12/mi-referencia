import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mi_referencia/domain/bank_provider.dart';
import 'package:mi_referencia/storage/shared_preferences_service.dart';

class InitLoader extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> setBank(String code, String name) async {
      ref.read(bankProvider.notifier).addBank(code, name);
    }

    Future<void> verifyInitialData() async {
      final bool initialData = await SharedPreferencesService().getInitalData();

      if (!initialData) {
        await setBank('0102', 'Banco de Venezuela');
        await setBank('0156', '100% Banco');
        await setBank('0172', 'Bancamiga Banco Universal, C.A');
        await setBank('0114', 'Bancaribe');
        await setBank('0171', 'Banco Activo');
        await setBank('0128', 'Banco Caroní');
        await setBank('0163', 'Banco del Tesoro');
        await setBank(
          '0175',
          'Banco Digital De Los Trabajadores, Banco Universal',
        );
        await setBank('0115', 'Banco Exterior');
        await setBank('0151', 'Banco Fondo Común');
        await setBank('0105', 'Banco Mercantil');
        await setBank('0191', 'Banco Nacional De Credito');
        await setBank('0138', 'Banco Plaza');
        await setBank('0137', 'Banco Sofitasa');
        await setBank('0104', 'Banco Venezolano de Credito');
        await setBank('0168', 'Bancrecer');
        await setBank('0134', 'Banesco');
        await setBank('0177', 'Banfanb');
        await setBank('0146', 'Bangente');
        await setBank('0174', 'Banplus');
        await setBank('0108', 'BBVA Provincial');
        await setBank('0157', 'Delsur Banco Universal');
        await setBank('0601', 'Instituto Municipal de Credito Popular');
        await setBank('0178', 'N58 Banco Digital Banco Microfinanciero S A');
        await setBank('0169', 'R4 Banco Microfinanciero C.A.');

        await SharedPreferencesService().setInitalData(true);
      }
    }

    useEffect(() {
      verifyInitialData();
      return null;
    }, []);

    return const SizedBox.shrink();
  }
}
