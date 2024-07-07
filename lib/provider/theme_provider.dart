import 'package:flutter/material.dart';
import 'package:speed_test/theme/appTheme.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeMode _themeMode = ThemeMode.system;
  late ColorScheme _darkScheme = darkColorScheme;
  late ColorScheme _lightScheme = lightColorScheme;
  ThemeMode get themeMode => _themeMode;
  setThemeMode(ThemeMode value) {
    _themeMode = value;
    notifyListeners();
  }

  ColorScheme get darkScheme => _darkScheme;
  setDarkScheme(ColorScheme value) {
    _darkScheme = value;
    notifyListeners();
  }

  ColorScheme get lightScheme => _lightScheme;
  setLightScheme(ColorScheme value) {
    _lightScheme = value;
    notifyListeners();
  }
}
