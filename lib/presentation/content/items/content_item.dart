import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/hadith_entity.dart';
import '../../state/content_settings_state.dart';
import '../../widgets/main_html_data.dart';

class ContentItem extends StatelessWidget {
  const ContentItem({
    super.key,
    required this.hadithModel,
    required this.contentIndex,
  });

  final HadithEntity hadithModel;
  final int contentIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.colorScheme;
    final bool isLight = theme.brightness == Brightness.light;
    return Consumer<ContentSettingsState>(
      builder: (context, contentSettings, _) {
        return Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          color: appColors.onSecondary.withOpacity(0.5),
          child: Padding(
            padding: AppStyles.paddingMini,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MainHtmlData(
                  htmlData: hadithModel.hadithArabic,
                  footnoteColor: appColors.primary,
                  font: AppStrings.arabicFonts[contentSettings.getArabicFontIndex],
                  fontSize: AppStyles.textSizes[contentSettings.getArabicFontSizeIndex] + 5,
                  textAlign: AppStyles.textAligns[contentSettings.getArabicFontAlignIndex],
                  fontColor: isLight ? Color(contentSettings.getArabicLightTextColor) : Color(contentSettings.getArabicDarkTextColor),
                  textDirection: TextDirection.rtl,
                  textHeight: 1.75,
                ),
                const Divider(indent: 16, endIndent: 16),
                MainHtmlData(
                  htmlData: hadithModel.hadithTranslation,
                  footnoteColor: appColors.primary,
                  font: AppStrings.translationFonts[contentSettings.getTranslationFontIndex],
                  fontSize: AppStyles.textSizes[contentSettings.getTranslationFontSizeIndex],
                  textAlign: AppStyles.textAligns[contentSettings.getTranslationFontAlignIndex],
                  fontColor: isLight ? Color(contentSettings.getTranslationLightTextColor) : Color(contentSettings.getTranslationDarkTextColor),
                  textDirection: TextDirection.ltr,
                  textHeight: 1.35,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
