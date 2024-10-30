import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/styles/app_styles.dart';
import '../../../core/strings/app_strings.dart';
import '../../state/content_settings_state.dart';
import '../../widgets/main_html_data.dart';

class CardFrontHadithItem extends StatelessWidget {
  const CardFrontHadithItem({
    super.key,
    required this.hadithTranslation,
    required this.apartHadithIndex,
  });

  final String hadithTranslation;
  final int apartHadithIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.colorScheme;
    final itemOddColor = appColors.inversePrimary.withOpacity(0.075);
    final itemEvenColor = appColors.inversePrimary.withOpacity(0.150);
    final bool isLight = theme.brightness == Brightness.light;
    return Consumer<ContentSettingsState>(
      builder: (context, contentSettings, _) {
        return Container(
          padding: AppStyles.padding,
          margin: AppStyles.bottomMini,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: apartHadithIndex.isOdd ? itemEvenColor : itemOddColor,
            borderRadius: AppStyles.borderMini,
          ),
          child: MainHtmlData(
            htmlData: hadithTranslation,
            font: AppStrings.arabicFonts[contentSettings.getArabicFontIndex],
            fontSize: AppStyles.textSizes[contentSettings.getArabicFontSizeIndex] + 5,
            textAlign: AppStyles.textAligns[contentSettings.getArabicFontAlignIndex],
            fontColor: isLight ? Color(contentSettings.getArabicLightTextColor) : Color(contentSettings.getArabicDarkTextColor),
            textDirection: TextDirection.rtl,
            textHeight: 1.75,
          ),
        );
      },
    );
  }
}
