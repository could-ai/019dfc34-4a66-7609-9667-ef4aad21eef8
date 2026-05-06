import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  Locale _locale = const Locale('ar');
  ThemeMode _themeMode = ThemeMode.light;

  Locale get locale => _locale;
  ThemeMode get themeMode => _themeMode;
  String get langCode => _locale.languageCode;

  void toggleLanguage() {
    _locale = _locale.languageCode == 'ar' ? const Locale('en') : const Locale('ar');
    notifyListeners();
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

final appState = AppState();
