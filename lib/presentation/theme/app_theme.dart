import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color _sapphireSky = Color(0xFF006ce4);
const Color _lavenderBlue = Color(0xFFd5deff);
const Color _platinum = Color(0xFFf4f4f5);

abstract class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: _sapphireSky,
      secondaryHeaderColor: _sapphireSky,
      scaffoldBackgroundColor: _platinum,
      appBarTheme: AppBarTheme(
        backgroundColor: _sapphireSky,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: _sapphireSky,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
      textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      iconTheme: IconThemeData(color: Colors.white),
      cardTheme: CardThemeData(color: _lavenderBlue),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _sapphireSky,
        foregroundColor: Colors.white,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          backgroundColor: WidgetStatePropertyAll(_sapphireSky),
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      primaryColor: Colors.blue,
      secondaryHeaderColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(backgroundColor: Colors.black),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
      ),
      textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      iconTheme: IconThemeData(color: Colors.white),
    );
  }
}
