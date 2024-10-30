import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/styles/app_styles.dart';
import '../../../core/strings/app_strings.dart';
import '../../../domain/entities/apart_hadith_entity.dart';
import '../../state/content_settings_state.dart';
import '../../widgets/main_html_data.dart';

class ContentApartHadithItem extends StatelessWidget {
  const ContentApartHadithItem({
    super.key,
    required this.apartHadithModel,
    required this.apartHadithIndex,
  });

  final ApartHadithEntity apartHadithModel;
  final int apartHadithIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.colorScheme;
    final itemOddColor = appColors.inversePrimary.withOpacity(0.075);
    final itemEvenColor = appColors.inversePrimary.withOpacity(0.150);
    final bool isLight = theme.brightness == Brightness.light;
    return Padding(
      padding: AppStyles.paddingBottomMini,
      child: Consumer<ContentSettingsState>(
        builder: (context, contentSettings, _) {
          return ListTile(
            onTap: () async {},
            tileColor: apartHadithIndex.isOdd ? itemOddColor : itemEvenColor,
            shape: AppStyles.shape,
            splashColor: appColors.inversePrimary.withOpacity(0.5),
            title: MainHtmlData(
              htmlData: apartHadithModel.hadithArabic,
              font: AppStrings.arabicFonts[contentSettings.getArabicFontIndex],
              fontSize: AppStyles.textSizes[contentSettings.getArabicFontSizeIndex] + 5,
              textAlign: AppStyles.textAligns[contentSettings.getArabicFontAlignIndex],
              fontColor: isLight ? Color(contentSettings.getArabicLightTextColor) : Color(contentSettings.getArabicDarkTextColor),
              textDirection: TextDirection.rtl,
              textHeight: 1.75,
            ),
            subtitle: MainHtmlData(
              htmlData: apartHadithModel.hadithTranslation,
              font: AppStrings.translationFonts[contentSettings.getTranslationFontIndex],
              fontSize: AppStyles.textSizes[contentSettings.getTranslationFontSizeIndex],
              textAlign: AppStyles.textAligns[contentSettings.getTranslationFontAlignIndex],
              fontColor: isLight ? Color(contentSettings.getTranslationLightTextColor) : Color(contentSettings.getTranslationDarkTextColor),
              textDirection: TextDirection.ltr,
              textHeight: 1.35,
            ),
          );
        },
      ),
    );
  }
}
