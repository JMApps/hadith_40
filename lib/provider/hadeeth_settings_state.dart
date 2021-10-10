import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HadeethSettingsState with ChangeNotifier {

  double _textSizeCount = 18;

  double get getTextSizeCount => _textSizeCount;

  Color _arabicColor = Colors.black;

  Color get getArabicColor => _arabicColor;

  Color _translationColor = Colors.black;

  Color get getTranslationColor => _translationColor;

  changeTextSizeCount(double newSizeCount) async {
    _textSizeCount = newSizeCount;
    notifyListeners();
  }

  changeArabicTextColor(Color newColor) async {
    _arabicColor = newColor;
    notifyListeners();
  }

  changeTranslationTextColor(Color newColor) async {
    _translationColor = newColor;
    notifyListeners();
  }

  saveTextSizeCount(double lastSizeCount) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setDouble('key_text_size', lastSizeCount);
  }

  getLastTextSizeCount() async {
    final preferences = await SharedPreferences.getInstance();
    _textSizeCount = preferences.getDouble('key_text_size') ?? 18;
  }

  saveArabicTextColor(Color lastArabicTextColor) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt('key_arabic_text_color', lastArabicTextColor.value);
  }

  saveTranslationTextColor(Color lastTranslationTextColor) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt('key_translation_text_color', lastTranslationTextColor.value);
  }

  getLastTextsColors() async {
    final preferences = await SharedPreferences.getInstance();
    _arabicColor = Color(preferences.getInt('key_arabic_text_color') ?? Colors.black.value);
    _translationColor = Color(preferences.getInt('key_translation_text_color') ?? Colors.black.value);
  }
}