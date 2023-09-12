import 'package:flutter/material.dart';
import 'package:hadith_40/presentation/widgets/content_html_text.dart';

class ApartFrontBackItem extends StatelessWidget {
  const ApartFrontBackItem({super.key, required this.translationText});

  final String translationText;

  @override
  Widget build(BuildContext context) {
    return ContentHtmlText(
      content: translationText,
    );
  }
}
