import 'package:flutter/material.dart';
import 'package:hadith_40/presentation/widgets/content_arabic_html_text.dart';

class ApartFrontCardItem extends StatelessWidget {
  const ApartFrontCardItem({super.key, required this.arabicText});

  final String arabicText;

  @override
  Widget build(BuildContext context) {
    return ContentArabicHtmlText(
      content: arabicText,
    );
  }
}
