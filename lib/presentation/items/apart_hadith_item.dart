import 'package:flutter/material.dart';
import 'package:hadith_40/domain/entities/apart_hadith_entity.dart';
import 'package:hadith_40/presentation/widgets/content_html_text.dart';

class ApartHadithItem extends StatelessWidget {
  const ApartHadithItem({
    super.key,
    required this.model,
    required this.index,
  });

  final ApartHadithEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color oddItemColor = appColors.primary.withOpacity(0.15);
    final Color evenItemColor = appColors.primary.withOpacity(0.05);
    return ListTile(
      onTap: () {},
      tileColor: index.isOdd ? oddItemColor : evenItemColor,
      title: Text(
        model.hadithArabic,
        style: TextStyle(
          color: appColors.primary,
          fontSize: 30,
          fontFamily: 'Arabic',
        ),
        textDirection: TextDirection.rtl,
      ),
      subtitle: ContentHtmlText(
        content: model.hadithTranslation,
      ),
    );
  }
}