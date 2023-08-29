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
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 1, 
    this.isDarkMode = false,
  }): assert(selectedColor >= 0, 'Selected color must be greater the 0'),
      assert(selectedColor < colorsList.length, 'Selected color must be greater the 0');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true, 
    colorSchemeSeed: colorsList[selectedColor],
    brightness: isDarkMode ? Brightness.dark: Brightness.light ,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    )
  );

  AppTheme copyWith({
    int? selectedColor, 
    bool? isDarkMode,
  }) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode,
  );
}
