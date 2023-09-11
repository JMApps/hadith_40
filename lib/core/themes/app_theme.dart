import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Gilroy',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.grey,
      secondary: Colors.blue,
      tertiary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: TextTheme(
      displayMedium: TextStyle(
        fontSize: 18,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Gilroy',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.teal,
      secondary: Colors.orange,
      tertiary: Colors.grey,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: TextTheme(
      displayMedium: TextStyle(
        fontSize: 18,
      ),
    ),
  );
}
