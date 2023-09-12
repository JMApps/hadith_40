import 'package:flutter/cupertino.dart';

class AppStyles {
  static const EdgeInsets mainMarding = EdgeInsets.all(16);
  static const EdgeInsets mainMardingMini = EdgeInsets.all(8);

  static const List<String> arabicFontFamily = [
    'Noto Naskh',
    'Vazirmatn',
    'Scheherez.',
  ];

  static const List<String> translationFontFamily = [
    'Gilroy',
    'Roboto',
    'Noto Serif',
  ];

  static const List<TextAlign> arabicTextAlign = [
    TextAlign.right,
    TextAlign.center,
    TextAlign.left,
    TextAlign.justify,
  ];

  static const List<TextAlign> translationTextAlign = [
    TextAlign.left,
    TextAlign.center,
    TextAlign.right,
    TextAlign.justify,
  ];
}
