import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hadith_40/core/styles/app_styles.dart';
import 'package:hadith_40/presentation/uistate/app_settings_state.dart';
import 'package:provider/provider.dart';

class ContentArabicHtmlText extends StatelessWidget {
  const ContentArabicHtmlText({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    final AppSettingsState settingsState = Provider.of<AppSettingsState>(context);
    return Html(
      data: content,
      style: {
        '#': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(settingsState.getArabicTextSize),
          fontFamily: AppStyles.arabicFontFamily[settingsState.getArabicFontIndex],
          textAlign: AppStyles.arabicTextAlign[settingsState.getTextArabicAlignIndex],
          direction: TextDirection.rtl,
          color: appTheme.brightness == Brightness.light
              ? settingsState.getArabicLightTextColor
              : settingsState.getArabicDarkTextColor,
        ),
        'small': Style(
          fontSize: FontSize(settingsState.getArabicTextSize - 8),
        ),
      },
    );
  }
}
