import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ContentArabicHtmlText extends StatelessWidget {
  const ContentArabicHtmlText({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Html(
      data: content,
      style: {
        '#': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(28),
          fontFamily: 'Arabic',
          direction: TextDirection.rtl,
          color: appColors.primary,
        ),
        'small': Style(
          fontSize: FontSize(18),
        ),
      },
    );
  }
}
