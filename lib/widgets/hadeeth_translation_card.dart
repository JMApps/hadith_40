import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HadeethTranslation extends StatelessWidget {
  const HadeethTranslation({Key? key, required this.hadeethTranslation})
      : super(key: key);

  final String hadeethTranslation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 4, right: 8, bottom: 8),
      child: Html(
        data: hadeethTranslation,
        style: {
          '#': Style(
            fontSize: const FontSize(18),
            fontFamily: 'Gilroy',
            textAlign: TextAlign.justify,
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
