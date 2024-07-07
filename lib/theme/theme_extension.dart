import 'package:flutter/material.dart';

extension UIThemeExtension on BuildContext {
  Color get canvasColor => Theme.of(this).canvasColor;
  Color get hoverColor => Theme.of(this).hoverColor;
  Color get inverseColor => Theme.of(this).primaryColor;
  Color get inverseBackgroundColor => Theme.of(this).secondaryHeaderColor;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;
  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;

  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;
  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;
  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;

  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;

}
