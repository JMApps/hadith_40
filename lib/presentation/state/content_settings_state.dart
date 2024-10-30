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

    _arabicLightTextColor = _getSetting(AppConstraints.keyArabicLightColor, Colors.blueGrey.shade900.value);
    _arabicDarkTextColor = _getSetting(AppConstraints.keyArabicDarkColor, Colors.blueGrey.shade100.value);

    _translationLightTextColor = _getSetting(AppConstraints.keyTranslationLightColor, Colors.blueGrey.shade900.value);
    _translationDarkTextColor = _getSetting(AppConstraints.keyTranslationDarkColor, Colors.blueGrey.shade100.value);
  }

  int _getSetting(String key, int defaultValue) {
    return _contentSettings.get(key, defaultValue: defaultValue);
  }

  void _setSetting(int value, String key) async {
    await _contentSettings.put(key, value);
    notifyListeners();
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

  set setArabicFontIndex(int index) {
    _arabicFontIndex = index;
    _setSetting(index, AppConstraints.keyArabicFontIndex);
  }

  set setTranslationFontIndex(int index) {
    _translationFontIndex = index;
    _setSetting(index, AppConstraints.keyTranslationFontIndex);
  }

  set setArabicFontSizeIndex(int index) {
    _arabicFontSizeIndex = index;
    _setSetting(index, AppConstraints.keyArabicFontSizeIndex);
  }

  set setTranslationFontSizeIndex(int index) {
    _translationFontSizeIndex = index;
    _setSetting(index, AppConstraints.keyTranslationFontSizeIndex);
  }

  set setArabicFontAlignIndex(int index) {
    _arabicFontAlignIndex = index;
    _setSetting(index, AppConstraints.keyArabicFontAlignIndex);
  }

  set setTranslationFontAlignIndex(int index) {
    _translationFontAlignIndex = index;
    _setSetting(index, AppConstraints.keyTranslationFontAlignIndex);
  }

  set setArabicLightTextColor(int color) {
    _arabicLightTextColor = color;
    _setSetting(color, AppConstraints.keyArabicLightColor);
  }

  set setArabicDarkTextColor(int color) {
    _arabicDarkTextColor = color;
    _setSetting(color, AppConstraints.keyArabicDarkColor);
  }

  set setTranslationLightTextColor(int color) {
    _translationLightTextColor = color;
    _setSetting(color, AppConstraints.keyTranslationLightColor);
  }

  set setTranslationDarkTextColor(int color) {
    _translationDarkTextColor = color;
    _setSetting(color, AppConstraints.keyTranslationDarkColor);
  }

  void setDefault() {
    setArabicFontIndex = 0;
    setTranslationFontIndex = 0;

    setArabicFontSizeIndex = 1;
    setTranslationFontSizeIndex = 1;

    setArabicFontAlignIndex = 0;
    setTranslationFontAlignIndex = 0;

    setArabicLightTextColor = Colors.blueGrey.shade900.value;
    setArabicDarkTextColor = Colors.blueGrey.shade100.value;

    setTranslationLightTextColor = Colors.blueGrey.shade900.value;
    setTranslationDarkTextColor = Colors.blueGrey.shade100.value;
    notifyListeners();
  }
}
