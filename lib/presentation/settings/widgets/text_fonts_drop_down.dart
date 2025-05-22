import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/content_settings_state.dart';

class TextFontsDropDown extends StatelessWidget {
  const TextFontsDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final itemSelectedTextStyle = TextStyle(fontSize: 16, fontFamily: AppConstraints.fontGilroy, color: appColors.primary, fontWeight: FontWeight.bold);
    return Consumer<ContentSettingsState>(
      builder: (context, contentSettings, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity(vertical: -4),
              title: Text(
                locale.font,
                style: AppStyles.mainTextStyle18Bold,
              ),
              leading: Icon(
                Icons.font_download,
                color: appColors.primary,
              ),
            ),
            _buildFontRow(
              label: locale.arabic,
              fontNames: AppStyles.arabicFonts,
              selectedFontIndex: contentSettings.getArabicFontIndex,
              onChanged: (newIndex) => contentSettings.setArabicFontIndex = newIndex,
              itemSelectedTextStyle: itemSelectedTextStyle,
              appColors: appColors,
            ),
            _buildFontRow(
              label: locale.translation,
              fontNames: AppStyles.translationFonts,
              selectedFontIndex: contentSettings.getTranslationFontIndex,
              onChanged: (newIndex) => contentSettings.setTranslationFontIndex = newIndex,
              itemSelectedTextStyle: itemSelectedTextStyle,
              appColors: appColors,
            ),
            const Divider(indent: 16, endIndent: 16),
          ],
        );
      },
    );
  }

  Widget _buildFontRow({
    required String label,
    required List<String> fontNames,
    required int selectedFontIndex,
    required ValueChanged<int> onChanged,
    required TextStyle itemSelectedTextStyle,
    required ColorScheme appColors,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppStyles.mainTextStyle18),
        DropdownButton<int>(
          iconEnabledColor: appColors.primary,
          padding: AppStyles.paddingHorizontal,
          borderRadius: AppStyles.border,
          elevation: 1,
          alignment: Alignment.centerRight,
          value: selectedFontIndex,
          items: List.generate(
            fontNames.length,
            (index) {
              return DropdownMenuItem<int>(
                value: index,
                child: Center(
                  child: Padding(
                    padding: AppStyles.paddingRightMini,
                    child: Text(
                      fontNames[index],
                      style: selectedFontIndex == index ? itemSelectedTextStyle : AppStyles.mainTextStyle18,
                    ),
                  ),
                ),
              );
            },
          ),
          onChanged: (newIndex) => onChanged(newIndex!),
          underline: Container(),
        ),
      ],
    );
  }
}
