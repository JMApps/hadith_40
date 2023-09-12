import 'package:flutter/material.dart';
import 'package:hadith_40/core/strings/app_constraints.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class AppSettingsState extends ChangeNotifier {
  final _contentSettingsBox = Hive.box(AppConstraints.keyMainAppSettingsBox);

  int _arabicFontIndex = 0;

  int get getArabicFontIndex => _arabicFontIndex;

  set changeArabicFontIndex(int index) {
    _arabicFontIndex = index;
    _contentSettingsBox.put(AppConstraints.keyArabicFontIndex, index);
    notifyListeners();
  }

  int _fontIndex = 2;

  int get getFontIndex => _fontIndex;

  set changeFontIndex(int index) {
    _fontIndex = index;
    _contentSettingsBox.put(AppConstraints.keyFontIndex, index);
    notifyListeners();
  }

  int _textArabicAlignIndex = 1;

  int get getTextArabicAlignIndex => _textArabicAlignIndex;

  set changeArabicTextAlignIndex(int index) {
    _textArabicAlignIndex = index;
    _contentSettingsBox.put(AppConstraints.keyArabicTextAlign, index);
    notifyListeners();
  }

  int _textAlignIndex = 1;

  int get getTextAlignIndex => _textAlignIndex;

  set changeTextAlignIndex(int index) {
    _textAlignIndex = index;
    _contentSettingsBox.put(AppConstraints.keyTextAlign, index);
    notifyListeners();
  }

  double _arabicTextSize = 25.0;

  double get getArabicTextSize => _arabicTextSize;

  set changeArabicTextSize(double size) {
    _arabicTextSize = size;
    _contentSettingsBox.put(AppConstraints.keyArabicTextSize, size);
    notifyListeners();
  }

  double _textSize = 18.0;

  double get getTextSize => _textSize;

  set changeTextSize(double size) {
    _textSize = size;
    _contentSettingsBox.put(AppConstraints.keyTextSize, size);
    notifyListeners();
  }

  Color _arabicLightTextColor = Colors.teal.shade700;

  Color get getArabicLightTextColor => _arabicLightTextColor;

  set changeArabicLightColor(Color color) {
    _arabicLightTextColor = color;
    _contentSettingsBox.put(AppConstraints.keyArabicLightTextColor, color.value);
    notifyListeners();
  }

  Color _lightTextColor = Colors.grey.shade900;

  Color get getLightTextColor => _lightTextColor;

  set changeLightColor(Color color) {
    _lightTextColor = color;
    _contentSettingsBox.put(AppConstraints.keyLightTextColor, color.value);
    notifyListeners();
  }

  Color _arabicDarkTextColor = Colors.teal.shade300;

  Color get getArabicDarkTextColor => _arabicDarkTextColor;

  set changeArabicDarkColor(Color color) {
    _arabicDarkTextColor = color;
    _contentSettingsBox.put(AppConstraints.keyArabicDarkTextColor, color.value);
    notifyListeners();
  }

  Color _darkTextColor = Colors.grey.shade100;

  Color get getDarkTextColor => _darkTextColor;

  set changeDarkColor(Color color) {
    _darkTextColor = color;
    _contentSettingsBox.put(AppConstraints.keyDarkTextColor, color.value);
    notifyListeners();
  }

  bool _adaptiveTheme = true;

  bool get getAdaptiveTheme => _adaptiveTheme;

  set changeAdaptiveTheme(bool onChanged) {
    _adaptiveTheme = onChanged;
    _contentSettingsBox.put(AppConstraints.keyAdaptiveTheme, onChanged);
    notifyListeners();
  }

  bool _darkTheme = false;

  bool get getDarkTheme => _darkTheme;

  set changeDarkTheme(bool onChanged) {
    _darkTheme = onChanged;
    _contentSettingsBox.put(AppConstraints.keyDarkTheme, onChanged);
    _darkTheme ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  bool _wakeLock = true;

  bool get getWakeLock => _wakeLock;

  set changeWakeLock(bool onChanged) {
    _wakeLock = onChanged;
    _wakeLock ? WakelockPlus.enable() : WakelockPlus.disable();
    _contentSettingsBox.put(AppConstraints.keyWakeLock, onChanged);
    notifyListeners();
  }

  AppSettingsState() {
    _arabicFontIndex = _contentSettingsBox.get(AppConstraints.keyArabicFontIndex, defaultValue: 0);
    _fontIndex = _contentSettingsBox.get(AppConstraints.keyFontIndex, defaultValue: 2);
    _textArabicAlignIndex = _contentSettingsBox.get(AppConstraints.keyArabicTextAlign, defaultValue: 1);
    _textAlignIndex = _contentSettingsBox.get(AppConstraints.keyTextAlign, defaultValue: 1);
    _arabicTextSize = _contentSettingsBox.get(AppConstraints.keyArabicTextSize, defaultValue: 25.0);
    _textSize = _contentSettingsBox.get(AppConstraints.keyTextSize, defaultValue: 18.0);
    _arabicLightTextColor = Color(_contentSettingsBox.get(AppConstraints.keyArabicLightTextColor, defaultValue: Colors.teal.shade700.value));
    _lightTextColor = Color(_contentSettingsBox.get(AppConstraints.keyLightTextColor, defaultValue: Colors.grey.shade900.value));
    _arabicDarkTextColor = Color(_contentSettingsBox.get(AppConstraints.keyArabicDarkTextColor, defaultValue: Colors.teal.shade300.value));
    _darkTextColor = Color(_contentSettingsBox.get(AppConstraints.keyDarkTextColor, defaultValue: Colors.grey.shade100.value));
    _adaptiveTheme = _contentSettingsBox.get(AppConstraints.keyAdaptiveTheme, defaultValue: true);
    _darkTheme = _contentSettingsBox.get(AppConstraints.keyDarkTheme, defaultValue: false);
    _wakeLock = _contentSettingsBox.get(AppConstraints.keyWakeLock, defaultValue: true);
    _wakeLock ? WakelockPlus.enable() : WakelockPlus.disable();
  }
}