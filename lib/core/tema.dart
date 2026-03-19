import 'package:flutter/material.dart';

class TemaApp {
  TemaApp._();

  static ThemeData tema() {
    ThemeData td = ThemeData(
      useMaterial3: true,
      primaryColor: Colors.blue,
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStatePropertyAll(Colors.white),
        fillColor: WidgetStatePropertyAll(Colors.blue.shade200),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50),
        ),
      ),
      // colorScheme: ColorScheme.dark(),
    );
    return td;
  }
}
