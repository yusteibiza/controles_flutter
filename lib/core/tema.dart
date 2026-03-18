import 'package:flutter/material.dart';

class TemaApp {
  TemaApp._();

  static ThemeData tema() {
    ThemeData td = ThemeData(
      useMaterial3: true,
      primaryColor: Colors.blue,

      // colorScheme: ColorScheme.dark(),
    );
    return td;
  }
}
