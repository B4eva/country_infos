import 'package:flutter/material.dart';

class AppThemeState extends ChangeNotifier {
  bool _isDarkModeEnabled = false;

  bool get isDarkMode => _isDarkModeEnabled;

  setDarkMode(bool value) {
    _isDarkModeEnabled = value;
  }

  void setLightTheme() {
    _isDarkModeEnabled = !_isDarkModeEnabled;
    notifyListeners();
  }

  void setDarkTheme() {
    _isDarkModeEnabled = true;
    notifyListeners();
  }

  ScrollController controller = ScrollController();
}
