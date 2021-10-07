import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HadeethArabic extends StatelessWidget {
  const HadeethArabic({Key? key, required this.hadeethArabic})
      : super(key: key);

  final String hadeethArabic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 8),
      child: SelectableHtml(
        data: hadeethArabic,
        style: {
          '#': Style(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            fontSize: const FontSize(20),
            fontFamily: 'Arabic',
            direction: TextDirection.rtl,
            lineHeight: LineHeight.rem(1.3),
          ),
          'small': Style(
            fontSize: const FontSize(14),
            color: Colors.black54,
          ),
        },
      ),
    );
  }
}
