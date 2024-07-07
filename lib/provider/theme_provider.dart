import 'package:flutter/material.dart';
import 'package:speed_test/theme/appTheme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ColorScheme _darkScheme = darkColorScheme;
  ColorScheme _lightScheme = lightColorScheme;

  ColorScheme get darkScheme => _darkScheme;
  ColorScheme get lightScheme => _lightScheme;

  void toggleTheme() {
    if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void setDarkScheme(ColorScheme scheme) {
    _darkScheme = scheme;
    notifyListeners();
  }

  void setLightScheme(ColorScheme scheme) {
    _lightScheme = scheme;
    notifyListeners();
  }
}
