import 'package:flutter/material.dart';

// Define a class to manage the application's text themes
class PElevatedButtonTheme {
  // Private constructor to prevent instantiation of this class
  PElevatedButtonTheme._();

  // Define a static field to hold the light text theme
  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5,
      foregroundColor: Colors.black,
      backgroundColor: Colors.blue,
      textStyle: const TextStyle(fontSize: 20),
      shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Set borderRadius to zero for square edges
          ),
    )
  );

  // Define a static field to hold the dark text theme
  static ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      textStyle: const TextStyle(fontSize: 20),
      shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Set borderRadius to zero for square edges
          ),
    )
  );
}
