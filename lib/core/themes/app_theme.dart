import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Gilroy',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.blue,
      secondary: Colors.red,
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
      selectedItemColor: Color(0xFF2196F3),
      unselectedItemColor: Color(0xDD000000),
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
      seedColor: Colors.blue,
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
      selectedItemColor: Color(0xFF2196F3),
      unselectedItemColor: Color(0xFFE3F2FD),
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

