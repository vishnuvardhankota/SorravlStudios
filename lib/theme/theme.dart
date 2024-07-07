import 'package:flutter/material.dart';

import 'card_theme.dart';
import 'elevated_btn_theme.dart';
import 'text_theme.dart';

// Define a class to manage the application themes
class PAppTheme {
  // Private constructor to prevent instantiation of this class
  PAppTheme._();

  // Define a static method to provide the light theme data
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.white,
      secondaryHeaderColor: const Color.fromARGB(255, 17, 37, 55),
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.grey[200],
      hoverColor: const Color.fromARGB(255, 146, 204, 235),
      textTheme: PTextTheme.lightTextTheme,
      cardTheme: PCardTheme.lightCardTheme,
      elevatedButtonTheme: PElevatedButtonTheme.lightElevatedButtonTheme);

  // Define a static method to provide the dark theme data
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      secondaryHeaderColor: Colors.black,
      scaffoldBackgroundColor: const Color.fromARGB(255, 17, 37, 55),
      canvasColor: Colors.blueGrey[900],
      hoverColor: const Color.fromARGB(255, 146, 204, 235),
      textTheme: PTextTheme.darkTextTheme,
      cardTheme: PCardTheme.darkCardTheme,
      elevatedButtonTheme: PElevatedButtonTheme.darkElevatedButtonTheme);
}
