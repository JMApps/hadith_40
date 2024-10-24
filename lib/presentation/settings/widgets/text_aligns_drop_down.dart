import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/content_settings_state.dart';

class TextAlignsDropDown extends StatelessWidget {
  const TextAlignsDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;

    Widget buildDropDownRow({
      required String label,
      required int selectedIndex,
      required List<Icon> alignIcons,
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
              alignIcons.length,
              (index) => DropdownMenuItem<int>(
                value: index,
                child: Center(
                  child: Padding(
                    padding: AppStyles.paddingRightMini,
                    child: alignIcons[index],
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
                AppStrings.textsAlign,
                style: AppStyles.mainTextStyle18Bold,
              ),
              leading: Icon(
                Icons.align_horizontal_left_rounded,
                color: appColors.primary,
              ),
            ),
            buildDropDownRow(
              label: AppStrings.arabic,
              selectedIndex: contentSettings.getArabicFontAlignIndex,
              alignIcons: AppStyles.arabicTextAlignIcons,
              onChanged: (newIndex) => contentSettings.setArabicFontAlignIndex = newIndex!,
            ),
            buildDropDownRow(
              label: AppStrings.translation,
              selectedIndex: contentSettings.getTranslationFontAlignIndex,
              alignIcons: AppStyles.textAlignIcons,
              onChanged: (newIndex) => contentSettings.setTranslationFontAlignIndex = newIndex!,
            ),
            const Divider(indent: 16, endIndent: 16),
          ],
        );
      },
    );
  }
}
