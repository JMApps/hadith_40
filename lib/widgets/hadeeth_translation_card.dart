import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HadeethTranslation extends StatelessWidget {
  const HadeethTranslation({Key? key, required this.hadeethTranslation})
      : super(key: key);

  final String hadeethTranslation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 16),
      child: SelectableHtml(
        data: hadeethTranslation,
        style: {
          '#': Style(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            fontSize: const FontSize(18),
            fontFamily: 'Gilroy',
            textAlign: TextAlign.start,
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
