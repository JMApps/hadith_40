import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Gilroy',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.teal,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: Color(0xFF00796B),
      unselectedItemColor: Color(0xFF424242),
    ),
    sliderTheme: const SliderThemeData(
      trackHeight: 1,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Gilroy',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.teal,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: Color(0xFF009688),
      unselectedItemColor: Color(0xFFB2DFDB),
    ),
    sliderTheme: const SliderThemeData(
      trackHeight: 1,
    ),
  );
}

extension CustomColors on ColorScheme {
  Color get mainDefault => brightness == Brightness.light
      ? const Color(0xB2000000)
      : const Color(0xFFBDBDBD);
}
