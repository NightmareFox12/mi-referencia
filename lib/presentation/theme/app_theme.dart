import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skeletonizer/skeletonizer.dart';

const Color _sapphireSky = Color(0xFF006ce4);
const Color _lavenderBlue = Color(0xFFd5deff);
const Color _platinum = Color(0xFFf4f4f5);

abstract class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
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
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          backgroundColor: WidgetStateColor.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? Colors.grey
                : _sapphireSky,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.black),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black),
        activeIndicatorBorder: BorderSide(color: _sapphireSky),
        border: OutlineInputBorder(borderSide: BorderSide(color: _sapphireSky)),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _sapphireSky),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      extensions: const [SkeletonizerConfigData()],
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      secondaryHeaderColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(backgroundColor: Colors.black),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
      ),
      textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      iconTheme: IconThemeData(color: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white),
        activeIndicatorBorder: BorderSide(color: Colors.white),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      extensions: const [SkeletonizerConfigData()],
    );
  }
}
