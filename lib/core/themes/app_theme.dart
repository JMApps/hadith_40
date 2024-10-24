import 'package:flutter/material.dart';

import '../strings/app_constraints.dart';
import '../styles/app_styles.dart';

class AppThemes {
  final Color _appColor;

  AppThemes(this._appColor);

  ThemeData get lightTheme => ThemeData(
    fontFamily: AppConstraints.fontGilroy,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: _appColor,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: AppStyles.paddingHorizontal,
      alignLabelWithHint: true,
      floatingLabelAlignment: FloatingLabelAlignment.center,
      border: OutlineInputBorder(
        borderRadius: AppStyles.border,
        borderSide: BorderSide(
          width: 0.5,
        ),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      showDragHandle: true,
      dragHandleSize: Size(48, 3),
    ),
  );

  ThemeData get darkTheme => ThemeData(
    fontFamily: AppConstraints.fontGilroy,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: _appColor,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: AppStyles.paddingHorizontal,
      alignLabelWithHint: true,
      floatingLabelAlignment: FloatingLabelAlignment.center,
      border: OutlineInputBorder(
        borderRadius: AppStyles.border,
        borderSide: BorderSide(
          width: 0.5,
        ),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      showDragHandle: true,
      dragHandleSize: Size(48, 3),
    ),
  );

}