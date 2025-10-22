import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HistoryScreen extends HookWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('on losted'),
        Expanded(
          child: ListView(
            children: [
              Text('aqui es scroll'),

              Text('aqui es scroll'),
              Text('aqui es scroll'),
              Text('aqui es scroll'),
              Text('aqui es scroll'),
            ],
          ),
        ),
      ],
    );
  }
}
