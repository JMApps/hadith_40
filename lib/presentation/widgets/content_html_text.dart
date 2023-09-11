import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ContentHtmlText extends StatelessWidget {
  const ContentHtmlText({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: content,
      style: {
        '#': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(18),
          fontFamily: 'Gilroy',
        ),
        'small': Style(
          fontSize: FontSize(14),
        ),
      },
    );
  }
}
