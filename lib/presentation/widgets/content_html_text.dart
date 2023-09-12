import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hadith_40/core/styles/app_styles.dart';
import 'package:hadith_40/presentation/uistate/app_settings_state.dart';
import 'package:provider/provider.dart';

class ContentHtmlText extends StatelessWidget {
  const ContentHtmlText({super.key, required this.content});

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
          fontSize: FontSize(settingsState.getTextSize),
          fontFamily: AppStyles.translationFontFamily[settingsState.getFontIndex],
          textAlign: AppStyles.translationTextAlign[settingsState.getTextAlignIndex],
          color: appTheme.brightness == Brightness.light
              ? settingsState.getLightTextColor
              : settingsState.getDarkTextColor,
        ),
        'small': Style(
          fontSize: FontSize(settingsState.getTextSize - 5),
        ),
      },
    );
  }
}
