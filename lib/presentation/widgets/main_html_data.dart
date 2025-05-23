import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../core/strings/app_constraints.dart';

class MainHtmlData extends StatelessWidget {
  const MainHtmlData({
    super.key,
    required this.htmlData,
    required this.font,
    required this.fontSize,
    required this.textAlign,
    required this.fontColor,
    required this.textDirection,
    required this.textHeight,
  });

  final String htmlData;
  final String font;
  final double fontSize;
  final TextAlign textAlign;
  final Color fontColor;
  final TextDirection textDirection;
  final double textHeight;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: htmlData,
      style: {
        '#': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontFamily: font,
          fontSize: FontSize(fontSize),
          textAlign: textAlign,
          color: fontColor,
          direction: textDirection,
          lineHeight: LineHeight(textHeight),
        ),
        'small': Style(
          fontSize: FontSize(fontSize - 7.5),
          color: fontColor.withAlpha(125),
          direction: textDirection,
          lineHeight: LineHeight(textHeight),
        ),
        'a': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(fontSize - 3),
          letterSpacing: 1.5,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontFamily: AppConstraints.fontGilroy,
        ),
      },
    );
  }
}
