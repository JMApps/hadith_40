import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../l10n/app_localizations.dart';

import '../../../../core/styles/app_styles.dart';
import '../../../domain/entities/apart_hadith_entity.dart';
import '../../state/apart_hadith_player_state.dart';
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
    AppLocalizations locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final appColors = theme.colorScheme;
    final itemOddColor = appColors.inversePrimary.withAlpha(15);
    final itemEvenColor = appColors.inversePrimary.withAlpha(55);
    final bool isLight = theme.brightness == Brightness.light;
    return Padding(
      padding: AppStyles.paddingBottomMini,
      child: Consumer<ContentSettingsState>(
        builder: (context, contentSettings, _) {
          return ListTile(
            onTap: () async {
              Provider.of<ApartHadithPlayerState>(context, listen: false).playTrackIndex(apartHadithIndex);
            },
            tileColor: Provider.of<ApartHadithPlayerState>(context).currentTrackIndex == apartHadithIndex ? appColors.inversePrimary.withAlpha(200) : apartHadithIndex.isOdd ? itemOddColor : itemEvenColor,
            shape: AppStyles.shape,
            splashColor: appColors.inversePrimary.withAlpha(125),
            title: MainHtmlData(
              htmlData: apartHadithModel.hadithArabic,
              font: AppStyles.arabicFonts[contentSettings.getArabicFontIndex],
              fontSize: AppStyles.textSizes[contentSettings.getArabicFontSizeIndex] + 5,
              textAlign: AppStyles.textAligns[contentSettings.getArabicFontAlignIndex],
              fontColor: isLight ? Color(contentSettings.getArabicLightTextColor) : Color(contentSettings.getArabicDarkTextColor),
              textDirection: TextDirection.rtl,
              textHeight: 1.75,
            ),
            subtitle: Visibility(
              visible: locale.localeName.contains('ru'),
              child: MainHtmlData(
                htmlData: apartHadithModel.hadithTranslation,
                font: AppStyles.translationFonts[contentSettings.getTranslationFontIndex],
                fontSize: AppStyles.textSizes[contentSettings.getTranslationFontSizeIndex],
                textAlign: AppStyles.textAligns[contentSettings.getTranslationFontAlignIndex],
                fontColor: isLight ? Color(contentSettings.getTranslationLightTextColor) : Color(contentSettings.getTranslationDarkTextColor),
                textDirection: TextDirection.ltr,
                textHeight: 1.35,
              ),
            ),
          );
        },
      ),
    );
  }
}
