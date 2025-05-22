import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../core/strings/app_constraints.dart';

class ContentSettingsState extends ChangeNotifier {
  final _contentSettings = Hive.box(AppConstraints.keyContentSettingsBox);

  late int _arabicFontIndex;
  late int _translationFontIndex;

  late int _arabicFontSizeIndex;
  late int _translationFontSizeIndex;

  late int _arabicFontAlignIndex;
  late int _translationFontAlignIndex;

  late int _arabicLightTextColor;
  late int _arabicDarkTextColor;

  late int _translationLightTextColor;
  late int _translationDarkTextColor;

  ContentSettingsState() {
    _initializeSettings();
  }

  void _initializeSettings() {
    _arabicFontIndex = _getSetting(AppConstraints.keyArabicFontIndex, 0);
    _translationFontIndex = _getSetting(AppConstraints.keyTranslationFontIndex, 0);

    _arabicFontSizeIndex = _getSetting(AppConstraints.keyArabicFontSizeIndex, 1);
    _translationFontSizeIndex = _getSetting(AppConstraints.keyTranslationFontSizeIndex, 1);

    _arabicFontAlignIndex = _getSetting(AppConstraints.keyArabicFontAlignIndex, 1);
    _translationFontAlignIndex = _getSetting(AppConstraints.keyTranslationFontAlignIndex, 1);

    _arabicLightTextColor = _getSetting(AppConstraints.keyArabicLightColor, Colors.blueGrey.shade900.toARGB32());
    _arabicDarkTextColor = _getSetting(AppConstraints.keyArabicDarkColor, Colors.blueGrey.shade100.toARGB32());

    _translationLightTextColor = _getSetting(AppConstraints.keyTranslationLightColor, Colors.blueGrey.shade900.toARGB32());
    _translationDarkTextColor = _getSetting(AppConstraints.keyTranslationDarkColor, Colors.blueGrey.shade100.toARGB32());
  }

  int get getArabicFontIndex => _arabicFontIndex;
  int get getTranslationFontIndex => _translationFontIndex;

  int get getArabicFontSizeIndex => _arabicFontSizeIndex;
  int get getTranslationFontSizeIndex => _translationFontSizeIndex;

  int get getArabicFontAlignIndex => _arabicFontAlignIndex;
  int get getTranslationFontAlignIndex => _translationFontAlignIndex;

  int get getArabicLightTextColor => _arabicLightTextColor;
  int get getArabicDarkTextColor => _arabicDarkTextColor;

  int get getTranslationLightTextColor => _translationLightTextColor;
  int get getTranslationDarkTextColor => _translationDarkTextColor;

  set setArabicFontIndex(int fontIndex) {
    if (_arabicFontIndex != fontIndex) {
      _arabicFontIndex = fontIndex;
      _setSetting(AppConstraints.keyArabicFontIndex, fontIndex);
    }
  }

  set setTranslationFontIndex(int fontIndex) {
    if (_translationFontIndex != fontIndex) {
      _translationFontIndex = fontIndex;
      _setSetting(AppConstraints.keyTranslationFontIndex, fontIndex);
    }
  }

  set setArabicFontSizeIndex(int fontSizedIndex) {
    if (_arabicFontSizeIndex != fontSizedIndex) {
      _arabicFontSizeIndex = fontSizedIndex;
      _setSetting(AppConstraints.keyArabicFontSizeIndex, fontSizedIndex);
    }
  }

  set setTranslationFontSizeIndex(int fontSizeIndex) {
    if (_translationFontSizeIndex != fontSizeIndex) {
      _translationFontSizeIndex = fontSizeIndex;
      _setSetting(AppConstraints.keyTranslationFontSizeIndex, fontSizeIndex);
    }
  }

  set setArabicFontAlignIndex(int fontAlignIndex) {
    if (_arabicFontAlignIndex != fontAlignIndex) {
      _arabicFontAlignIndex = fontAlignIndex;
      _setSetting(AppConstraints.keyArabicFontAlignIndex, fontAlignIndex);
    }
  }

  set setTranslationFontAlignIndex(int fontAlignIndex) {
    if (_translationFontAlignIndex != fontAlignIndex) {
      _translationFontAlignIndex = fontAlignIndex;
      _setSetting(AppConstraints.keyTranslationFontAlignIndex, fontAlignIndex);
    }
  }

  set setArabicLightTextColor(int color) {
    if (_arabicLightTextColor != color) {
      _arabicLightTextColor = color;
      _setSetting(AppConstraints.keyArabicLightColor, color);
    }
  }

  set setArabicDarkTextColor(int color) {
    if (_arabicDarkTextColor != color) {
      _arabicDarkTextColor = color;
      _setSetting(AppConstraints.keyArabicDarkColor, color);
    }
  }

  set setTranslationLightTextColor(int color) {
    if (_translationLightTextColor != color) {
      _translationLightTextColor = color;
      _setSetting(AppConstraints.keyTranslationLightColor, color);
    }
  }

  set setTranslationDarkTextColor(int color) {
    if (_translationDarkTextColor != color) {
      _translationDarkTextColor = color;
      _setSetting(AppConstraints.keyTranslationDarkColor, color);
    }
  }

  void setDefault() {
    setArabicFontIndex = 0;
    setTranslationFontIndex = 0;

    setArabicFontSizeIndex = 1;
    setTranslationFontSizeIndex = 1;

    setArabicFontAlignIndex = 1;
    setTranslationFontAlignIndex = 1;

    setArabicLightTextColor = Colors.blueGrey.shade900.toARGB32();
    setArabicDarkTextColor = Colors.blueGrey.shade100.toARGB32();

    setTranslationLightTextColor = Colors.blueGrey.shade900.toARGB32();
    setTranslationDarkTextColor = Colors.blueGrey.shade100.toARGB32();
    notifyListeners();
  }

  void _setSetting(String key, int value) async {
    await _contentSettings.put(key, value);
    notifyListeners();
  }
  
  int _getSetting(String key, int defaultValue) {
    return _contentSettings.get(key, defaultValue: defaultValue);
  }
}
