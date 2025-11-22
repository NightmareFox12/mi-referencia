import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color _persianBlue = Color(0xFF2b7fff);
const Color _lavenderBlue = Color(0xFFd5deff);

abstract class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: _persianBlue,
      secondaryHeaderColor: _persianBlue,
      scaffoldBackgroundColor: Color(0xFFf4f4f5),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF6594ff),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF6594ff),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
      textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      iconTheme: IconThemeData(color: Colors.white),
      cardTheme: CardThemeData(color: _lavenderBlue),
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
