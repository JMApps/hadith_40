import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/content_settings_state.dart';

class TextSizesDropDown extends StatelessWidget {
  const TextSizesDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final itemSelectedTextStyle = TextStyle(fontSize: 16, fontFamily: AppConstraints.fontGilroy, color: appColors.primary, fontWeight: FontWeight.bold);
    Widget buildDropDownRow({
      required String label,
      required int selectedIndex,
      required ValueChanged<int?> onChanged,
    }) {
      return Row(
        children: [
          Text(label, style: AppStyles.mainTextStyle18),
          const Spacer(),
          DropdownButton<int>(
            iconEnabledColor: appColors.primary,
            padding: AppStyles.paddingHorizontal,
            borderRadius: AppStyles.border,
            elevation: 1,
            alignment: Alignment.centerRight,
            value: selectedIndex,
            items: List.generate(
              locale.sizes.split(', ').length,
              (index) => DropdownMenuItem<int>(
                value: index,
                child: Center(
                  child: Padding(
                    padding: AppStyles.paddingRightMini,
                    child: Text(
                      locale.sizes.split(', ')[index],
                      style: selectedIndex == index ? itemSelectedTextStyle : AppStyles.mainTextStyle18,
                    ),
                  ),
                ),
              ),
            ),
            onChanged: onChanged,
            underline: Container(),
          ),
        ],
      );
    }

    return Consumer<ContentSettingsState>(
      builder: (context, contentSettings, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(vertical: -4),
              title: Text(
                locale.textSize,
                style: AppStyles.mainTextStyle18Bold,
              ),
              leading: Icon(
                Icons.format_size,
                color: appColors.primary,
              ),
            ),
            buildDropDownRow(
              label: locale.arabic,
              selectedIndex: contentSettings.getArabicFontSizeIndex,
              onChanged: (newIndex) => contentSettings.setArabicFontSizeIndex = newIndex!,
            ),
            buildDropDownRow(
              label: locale.translation,
              selectedIndex: contentSettings.getTranslationFontSizeIndex,
              onChanged: (newIndex) => contentSettings.setTranslationFontSizeIndex = newIndex!,
            ),
            const Divider(indent: 16, endIndent: 16),
          ],
        );
      },
    );
  }
}
