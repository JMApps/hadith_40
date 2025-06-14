import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/content_settings_state.dart';

class TextColors extends StatelessWidget {
  const TextColors({super.key});

  void _showColorPickerDialog({
    required BuildContext context,
    required String title,
    required int currentColor,
    required Function(int) onColorSelected,
  }) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        alignment: Alignment.center,
        actionsPadding: AppStyles.paddingMini,
        title: Text(
          title,
          style: AppStyles.mainTextStyle18Bold,
        ),
        content: Material(
          color: Colors.transparent,
          child: MaterialColorPicker(
            alignment: WrapAlignment.center,
            iconSelected: Icons.check_circle,
            elevation: 0.5,
            onColorChange: (Color? color) => onColorSelected(color!.toARGB32()),
            selectedColor: Color(currentColor),
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              locale.close,
              style: AppStyles.mainTextStyle18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorPickerTile({
    required BuildContext context,
    required String title,
    required int lightColor,
    required int darkColor,
    required Function(int) onLightColorChanged,
    required Function(int) onDarkColorChanged,
  }) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(vertical: -4),
      title: Text(title, style: AppStyles.mainTextStyle18),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.filledTonal(
            onPressed: () {
              _showColorPickerDialog(
                context: context,
                title: locale.forLightTheme,
                currentColor: lightColor,
                onColorSelected: onLightColorChanged,
              );
            },
            icon: Icon(
              Icons.color_lens_rounded,
              color: Color(lightColor),
            ),
          ),
          IconButton.filledTonal(
            onPressed: () {
              _showColorPickerDialog(
                context: context,
                title: locale.forDarkTheme,
                currentColor: darkColor,
                onColorSelected: onDarkColorChanged,
              );
            },
            icon: Icon(
              Icons.color_lens_rounded,
              color: Color(darkColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer<ContentSettingsState>(
      builder: (context, contentSettings, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity(vertical: -4),
              title: Text(
                locale.textColor,
                style: AppStyles.mainTextStyle18Bold,
              ),
              leading: Icon(
                Icons.color_lens,
                color: appColors.primary,
              ),
            ),
            _buildColorPickerTile(
              context: context,
              title: locale.arabic,
              lightColor: contentSettings.getArabicLightTextColor,
              darkColor: contentSettings.getArabicDarkTextColor,
              onLightColorChanged: (color) => contentSettings.setArabicLightTextColor = color,
              onDarkColorChanged: (color) => contentSettings.setArabicDarkTextColor = color,
            ),
            const SizedBox(height: 4),
            _buildColorPickerTile(
              context: context,
              title: locale.translation,
              lightColor: contentSettings.getTranslationLightTextColor,
              darkColor: contentSettings.getTranslationDarkTextColor,
              onLightColorChanged: (color) => contentSettings.setTranslationLightTextColor = color,
              onDarkColorChanged: (color) => contentSettings.setTranslationDarkTextColor = color,
            ),
            const Divider(indent: 16, endIndent: 16),
          ],
        );
      },
    );
  }
}
