import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // Initialize theme mode as light mode by default
  ThemeMode _themeMode = ThemeMode.light;

  // Getter for theme mode
  ThemeMode get themeMode => _themeMode;

  // Setter for theme mode
  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    // Notify listeners whenever the theme mode changes
    notifyListeners();
  }

  // Function to toggle between light and dark theme mode
  void toggleThemeMode() {
    // If the current theme mode is light, switch to dark mode, and vice versa
    themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
