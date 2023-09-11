import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ContentArabicHtmlText extends StatelessWidget {
  const ContentArabicHtmlText({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: content,
      style: {
        '#': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(28),
          fontFamily: 'Arabic',
          direction: TextDirection.rtl,
        ),
        'small': Style(
          fontSize: FontSize(18),
        ),
      },
    );
  }
}
