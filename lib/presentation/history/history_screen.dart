import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HistoryScreen extends HookWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: Text('yo quisiera amarla como usted se merece')),
      ),
    );
  }
}
