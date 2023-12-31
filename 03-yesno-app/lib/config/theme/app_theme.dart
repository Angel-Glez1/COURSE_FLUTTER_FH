import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);

const List<Color> _colorsTheme = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorsTheme.length - 1,
            'Colors must be between ${_colorsTheme.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorsTheme[selectedColor]);
  }
}
