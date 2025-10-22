import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mi_referencia/presentation/history/history_screen.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(Duration(seconds: 1), () {
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HistoryScreen()),
          );
        }
      });
      return null;
    }, []);

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 6,
              children: [
                Image.asset('assets/images/logo.png', width: 120, height: 120),
                Text(
                  'Mi Referencia',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
