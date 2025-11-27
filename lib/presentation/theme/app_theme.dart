import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skeletonizer/skeletonizer.dart';

const Color _aliceBlue = Color(0XffEBF4FF);
const Color _sapphireSky = Color(0xFF006ce4);
const Color _lavenderBlue = Color(0xFFd5deff);
const Color _platinum = Color(0xFFf4f4f5);

// === NIGHT COLORS ===
const Color _imperialBlue = Color(0xFF00275B);

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
        selectedItemColor: _aliceBlue,
        unselectedItemColor: _aliceBlue,
      ),
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
        prefixIconColor: Colors.black,
        suffixIconColor: Colors.black,
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
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Colors.black,
        selectionHandleColor: Colors.black,
      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        bodySmall: TextStyle(color: Colors.black),
        displayLarge: TextStyle(color: Colors.black),
        displayMedium: TextStyle(color: Colors.black),
        displaySmall: TextStyle(color: Colors.black),
        headlineLarge: TextStyle(color: Colors.black),
        headlineMedium: TextStyle(color: Colors.black),
        headlineSmall: TextStyle(color: Colors.black),
        titleLarge: TextStyle(color: Colors.black),
        titleSmall: TextStyle(color: Colors.black),
        labelLarge: TextStyle(color: Colors.black),
        labelMedium: TextStyle(color: Colors.black),
        labelSmall: TextStyle(color: Colors.black),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateColor.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? _aliceBlue
                : Colors.white,
          ),
        ),
      ),
      extensions: const [SkeletonizerConfigData()],
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _imperialBlue,
      secondaryHeaderColor: _sapphireSky,
      scaffoldBackgroundColor: Color(0xFF020618),
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
        selectedItemColor: _aliceBlue,
        unselectedItemColor: _aliceBlue,
      ),
      iconTheme: IconThemeData(color: Colors.white),
      cardTheme: CardThemeData(color: Color(0xFF051120)),
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
          foregroundColor: WidgetStatePropertyAll(Colors.white),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white),
        prefixIconColor: Colors.white,
        suffixIconColor: Colors.white,
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
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.white,
        selectionColor: Colors.white,
        selectionHandleColor: Colors.white,
      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
        displayLarge: TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: Colors.white),
        displaySmall: TextStyle(color: Colors.white),
        headlineLarge: TextStyle(color: Colors.white),
        headlineMedium: TextStyle(color: Colors.white),
        headlineSmall: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        labelLarge: TextStyle(color: Colors.white),
        labelMedium: TextStyle(color: Colors.white),
        labelSmall: TextStyle(color: Colors.white),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateColor.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? _aliceBlue
                : Colors.white,
          ),
        ),
      ),
      extensions: const [SkeletonizerConfigData()],
    );
  }
}
