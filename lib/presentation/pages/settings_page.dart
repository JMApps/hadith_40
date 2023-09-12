import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:hadith_40/core/styles/app_styles.dart';
import 'package:hadith_40/presentation/uistate/app_settings_state.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ThemeData appTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.settings),
      ),
      body: SingleChildScrollView(
        padding: AppStyles.mainMarding,
        child: Consumer<AppSettingsState>(
          builder: (context, settingsState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  locale.arabicTextFont,
                ),
                const SizedBox(height: 8),
                CupertinoSlidingSegmentedControl(
                  thumbColor: appTheme.colorScheme.inversePrimary,
                  padding: const EdgeInsets.all(4),
                  children: <int, Widget>{
                    0: Text(
                      'Uthmani',
                    ),
                    1: Text(
                      'Hafs',
                    ),
                    2: Text(
                      'Sch',
                    ),
                  },
                  groupValue: settingsState.getArabicFontIndex,
                  onValueChanged: (int? index) {
                    settingsState.changeArabicFontIndex = index!;
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  locale.textFont,
                ),
                const SizedBox(height: 8),
                CupertinoSlidingSegmentedControl(
                  thumbColor: appTheme.colorScheme.inversePrimary,
                  padding: const EdgeInsets.all(4),
                  children: <int, Widget>{
                    0: Text(
                      'Montserrat',
                    ),
                    1: Text(
                      'Gilroy',
                    ),
                    2: Text(
                      'Nexa',
                    ),
                  },
                  groupValue: settingsState.getFontIndex,
                  onValueChanged: (int? index) {
                    settingsState.changeFontIndex = index!;
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  locale.arabicAlignText,
                ),
                const SizedBox(height: 8),
                CupertinoSlidingSegmentedControl(
                  thumbColor: appTheme.colorScheme.inversePrimary,
                  padding: const EdgeInsets.all(4),
                  children: const <int, Widget>{
                    0: Icon(CupertinoIcons.text_alignleft),
                    1: Icon(CupertinoIcons.text_aligncenter),
                    2: Icon(CupertinoIcons.text_alignright),
                    3: Icon(CupertinoIcons.text_justify),
                  },
                  groupValue: settingsState.getTextArabicAlignIndex,
                  onValueChanged: (int? index) {
                    settingsState.changeArabicTextAlignIndex = index!;
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  locale.alignText,
                ),
                const SizedBox(height: 8),
                CupertinoSlidingSegmentedControl(
                  thumbColor: appTheme.colorScheme.inversePrimary,
                  padding: const EdgeInsets.all(4),
                  children: const <int, Widget>{
                    0: Icon(CupertinoIcons.text_alignleft),
                    1: Icon(CupertinoIcons.text_aligncenter),
                    2: Icon(CupertinoIcons.text_alignright),
                    3: Icon(CupertinoIcons.text_justify),
                  },
                  groupValue: settingsState.getTextAlignIndex,
                  onValueChanged: (int? index) {
                    settingsState.changeTextAlignIndex = index!;
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  locale.arabicTextSize,
                ),
                Slider(
                  value: settingsState.getArabicTextSize,
                  min: 14,
                  max: 100,
                  divisions: 100,
                  label: settingsState.getArabicTextSize.round().toString(),
                  onChanged: (double? size) {
                    settingsState.changeArabicTextSize = size!;
                  },
                ),
                Text(
                  locale.textSize,
                ),
                Slider(
                  value: settingsState.getTextSize,
                  min: 14,
                  max: 100,
                  divisions: 100,
                  label: settingsState.getTextSize.round().toString(),
                  onChanged: (double? size) {
                    settingsState.changeTextSize = size!;
                  },
                ),
                Card(
                  child: ListTile(
                    contentPadding: AppStyles.mainMardingMini,
                    visualDensity: const VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                    title: Text(
                      locale.arabicTextColor,
                    ),
                    leading: Icon(
                      Icons.palette_outlined,
                      color: appTheme.brightness == Brightness.dark
                          ? settingsState.getArabicDarkTextColor
                          : settingsState.getArabicLightTextColor,
                    ),
                    trailing: Card(
                      color: appTheme.colorScheme.inversePrimary,
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: Text(
                                      locale.forLightTheme,
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Material(
                                      color: Colors.transparent,
                                      child: MaterialColorPicker(
                                        onlyShadeSelection: true,
                                        onColorChange: (Color color) {
                                          settingsState.changeArabicLightColor = color;
                                        },
                                        selectedColor:
                                        settingsState.getArabicLightTextColor,
                                      ),
                                    ),
                                    actions: [
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          locale.close,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                settingsState.getArabicLightTextColor,
                              ),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: Text(
                                      locale.forDarkTheme,
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Material(
                                      color: Colors.transparent,
                                      child: MaterialColorPicker(
                                        onlyShadeSelection: true,
                                        onColorChange: (Color color) {
                                          settingsState.changeArabicDarkColor =
                                              color;
                                        },
                                        selectedColor:
                                        settingsState.getArabicDarkTextColor,
                                      ),
                                    ),
                                    actions: [
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          locale.close,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                settingsState.getArabicDarkTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Card(
                  child: ListTile(
                    contentPadding: AppStyles.mainMardingMini,
                    visualDensity: const VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                    title: Text(
                      locale.textColor,
                    ),
                    leading: Icon(
                      Icons.palette_outlined,
                      color: appTheme.brightness == Brightness.dark
                          ? settingsState.getDarkTextColor
                          : settingsState.getLightTextColor,
                    ),
                    trailing: Card(
                      color: appTheme.colorScheme.inversePrimary,
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: Text(
                                      locale.forLightTheme,
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Material(
                                      color: Colors.transparent,
                                      child: MaterialColorPicker(
                                        onlyShadeSelection: true,
                                        onColorChange: (Color color) {
                                          settingsState.changeLightColor = color;
                                        },
                                        selectedColor:
                                        settingsState.getLightTextColor,
                                      ),
                                    ),
                                    actions: [
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          locale.close,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: settingsState.getLightTextColor,
                              ),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: Text(
                                      locale.forDarkTheme,
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Material(
                                      color: Colors.transparent,
                                      child: MaterialColorPicker(
                                        onlyShadeSelection: true,
                                        onColorChange: (Color color) {
                                          settingsState.changeDarkColor = color;
                                        },
                                        selectedColor:
                                        settingsState.getDarkTextColor,
                                      ),
                                    ),
                                    actions: [
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          locale.close,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: settingsState.getDarkTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SwitchListTile(
                  value: settingsState.getAdaptiveTheme,
                  onChanged: (bool? onChanged) {
                    settingsState.changeAdaptiveTheme = onChanged!;
                  },
                  title: Text(
                    locale.adaptiveTheme,
                  ),
                ),
                SwitchListTile(
                  value: settingsState.getDarkTheme,
                  onChanged: settingsState.getAdaptiveTheme
                      ? null
                      : (bool? onChanged) {
                    settingsState.changeDarkTheme = onChanged!;
                  },
                  title: Text(
                    locale.darkTheme,
                  ),
                ),
                SwitchListTile(
                  value: settingsState.getWakeLock,
                  onChanged: (bool? onChanged) {
                    settingsState.changeWakeLock = onChanged!;
                  },
                  title: Text(
                    locale.displayAlways,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
