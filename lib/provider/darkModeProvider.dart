import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/darkthemePrefs.dart';

class DarkModeProvider extends ChangeNotifier {
  DarkThemePreference darkThemePrefs = DarkThemePreference();
  bool _isDark = false;

  bool get isModeDark => _isDark;

  Future<void> getMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool('mode') ?? false;
    notifyListeners();
  }

  Future<void> setMode(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark = newValue;
    await prefs.setBool('mode', newValue);
    notifyListeners();
  }

  double _sliderValue = 0.2;

  double get sliderValue => _sliderValue;

  getSliderValue(double value) {
    _sliderValue = value;
    notifyListeners();
  }
}
