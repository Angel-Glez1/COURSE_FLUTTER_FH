import 'package:flutter/material.dart';

const colorsList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 1})
      : assert(selectedColor >= 0, 'Selected color must be greater the 0'),
      assert(selectedColor < colorsList.length -1, 'Selected color must be greater the 0');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true, 
    colorSchemeSeed: colorsList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );
}
