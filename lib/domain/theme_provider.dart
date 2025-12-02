import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:mi_referencia/storage/shared_preferences_service.dart';

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    _loadInitialThemeMode();
    return ThemeMode.light;
  }

  void _loadInitialThemeMode() async {
    final bool isDarkMode = await SharedPreferencesService().getDarkMode();
    state = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme(bool isDarkMode) async {
    await SharedPreferencesService().setDarkMode(isDarkMode);
    state = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
}

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);
