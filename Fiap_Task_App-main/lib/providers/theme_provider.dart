import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  // This method toggles the theme between dark and light mode
  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}