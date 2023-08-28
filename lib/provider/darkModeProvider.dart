import 'package:flutter/material.dart';

import '../controller/darkthemePrefs.dart';

class DarkModeProvider extends ChangeNotifier {
  DarkThemePreference darkThemePrefs = DarkThemePreference();
  bool _isDark = false;

  bool get isModeDark => _isDark;

  void setMode(bool mode) {
    _isDark = mode;
    darkThemePrefs.setDarkTheme(mode);
    notifyListeners();
  }
}
