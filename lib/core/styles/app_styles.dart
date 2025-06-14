import 'package:flutter/material.dart';

import '../strings/app_constraints.dart';

class AppStyles {
  static const EdgeInsets padding = EdgeInsets.all(16);
  static const EdgeInsets paddingMini = EdgeInsets.all(8);

  static const EdgeInsets withoutTop = EdgeInsets.only(left: 16, bottom: 16, right: 16);
  static const EdgeInsets withoutTopMini = EdgeInsets.only(left: 8, bottom: 8, right: 8);
  static const EdgeInsets withoutBottom = EdgeInsets.only(left: 16, top: 16, right: 16);
  static const EdgeInsets withoutBottomMini = EdgeInsets.only(left: 8, top: 8, right: 8);
  static const EdgeInsets bottomTopMini = EdgeInsets.only(left: 8, bottom: 16, right: 8, top: 8);
  static const EdgeInsets bottomMini = EdgeInsets.only(bottom: 8);
  static const EdgeInsets apartListTile = EdgeInsets.fromLTRB(16, 8, 8, 8);

  static const EdgeInsets paddingBottomMini = EdgeInsets.only(bottom: 8);
  static const EdgeInsets paddingRightMini = EdgeInsets.only(right: 8);

  static const EdgeInsets paddingHorizontal = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets paddingHorizontalMini = EdgeInsets.symmetric(horizontal: 8);

  static const BorderRadius border = BorderRadius.all(Radius.circular(20));
  static const BorderRadius borderMini = BorderRadius.all(Radius.circular(10));

  static const RoundedRectangleBorder shape = RoundedRectangleBorder(borderRadius: border);

  static const RoundedRectangleBorder shapeTop = RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)));

  static const TextStyle mainTextStyle16 = TextStyle(fontSize: 16.0, fontFamily: AppConstraints.fontGilroy);
  static const TextStyle mainTextStyle18 = TextStyle(fontSize: 18.0, fontFamily: AppConstraints.fontGilroy);
  static const TextStyle mainTextStyle18Bold = TextStyle(fontSize: 18.0, fontFamily: AppConstraints.fontGilroy, fontWeight: FontWeight.bold);

  static const textAlignIcons = <Icon>[
    Icon(Icons.format_align_left_rounded),
    Icon(Icons.format_align_center_rounded),
    Icon(Icons.format_align_right_rounded),
    Icon(Icons.format_align_justify_rounded),
  ];

  static const arabicTextAlignIcons = <Icon>[
    Icon(Icons.format_align_right_rounded),
    Icon(Icons.format_align_center_rounded),
    Icon(Icons.format_align_left_rounded),
    Icon(Icons.format_align_justify_rounded),
  ];

  static const List<String> arabicFonts = [
    'Hafs',
    'Noto Naskh',
    'Scheherazade',
  ];

  static const List<String> translationFonts = [
    'Gilroy',
    'SF Pro',
    'Roboto',
  ];

  static const textSizes = <double>[
    16.0,
    18.0,
    22.0,
    35.0,
    50.0,
  ];

  static const List<TextAlign> textAligns = [
    TextAlign.start,
    TextAlign.center,
    TextAlign.end,
    TextAlign.justify,
  ];
}
