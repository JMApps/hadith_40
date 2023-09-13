import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/core/styles/app_styles.dart';
import 'package:hadith_40/domain/entities/content_hadith_entity.dart';
import 'package:hadith_40/presentation/widgets/content_arabic_html_text.dart';
import 'package:hadith_40/presentation/widgets/content_html_text.dart';

class ContentHadithItem extends StatelessWidget {
  const ContentHadithItem({
    super.key,
    required this.model,
    required this.index,
  });

  final ContentHadithEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return CupertinoScrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: AppStyles.mainMardingMini,
              alignment: Alignment.center,
              color: appColors.inversePrimary,
              child: Text(
                model.hadithTitle,
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              contentPadding: AppStyles.mainMardingMini,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ContentArabicHtmlText(
                  content: model.hadithArabic,
                ),
              ),
              subtitle: ContentHtmlText(
                content: model.hadithTranslation,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
