import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/styles/app_styles.dart';
import '../../state/content_settings_state.dart';
import '../../widgets/main_html_data.dart';

class CardBackHadithItem extends StatelessWidget {
  const CardBackHadithItem({
    super.key,
    required this.hadithArabic,
    required this.apartHadithIndex,
  });

  final String hadithArabic;
  final int apartHadithIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.colorScheme;
    final itemOddColor = appColors.inversePrimary.withAlpha(15);
    final itemEvenColor = appColors.inversePrimary.withAlpha(55);
    final bool isLight = theme.brightness == Brightness.light;
    return Consumer<ContentSettingsState>(
      builder: (context, contentSettings, _) {
        return Container(
          padding: AppStyles.padding,
          alignment: Alignment.center,
          margin: AppStyles.bottomMini,
          decoration: BoxDecoration(
            color: apartHadithIndex.isOdd ? itemEvenColor : itemOddColor,
            borderRadius: AppStyles.borderMini,
          ),
          child: MainHtmlData(
            htmlData: hadithArabic,
            font: AppStyles.translationFonts[contentSettings.getTranslationFontIndex],
            fontSize: AppStyles.textSizes[contentSettings.getTranslationFontSizeIndex],
            textAlign: AppStyles.textAligns[contentSettings.getTranslationFontAlignIndex],
            fontColor: isLight ? Color(contentSettings.getTranslationLightTextColor) : Color(contentSettings.getTranslationDarkTextColor),
            textDirection: TextDirection.ltr,
            textHeight: 1.35,
          ),
        );
      },
    );
  }
}
