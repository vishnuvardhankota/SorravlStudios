import 'package:flutter/material.dart';

// Define a class to manage the application's text themes
class PCardTheme {
  // Private constructor to prevent instantiation of this class
  PCardTheme._();

  // Define a static field to hold the light text theme
  static CardTheme lightCardTheme = const CardTheme(elevation: 5,color: Colors.white);

  // Define a static field to hold the dark text theme
  static CardTheme darkCardTheme = CardTheme(elevation: 5,color: Colors.grey[850]);
}
