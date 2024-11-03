import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/strings/app_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/app_settings_state.dart';

class ThemeModeDropDown extends StatelessWidget {
  const ThemeModeDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final itemSelectedTextStyle = TextStyle(fontSize: 16, fontFamily: AppConstraints.fontGilroy, color: appColors.primary, fontWeight: FontWeight.bold);
    return Consumer<AppSettingsState>(
      builder: (BuildContext context, appSettings, _) {
        return ListTile(
          visualDensity: VisualDensity.comfortable,
          title: Text(
            locale.theme,
            style: AppStyles.mainTextStyle18Bold,
          ),
          subtitle: Text(
            locale.themeApp,
            style: AppStyles.mainTextStyle16,
          ),
          leading: Icon(Icons.brightness_4_outlined),
          trailing: DropdownButton<int>(
            iconEnabledColor: appColors.primary,
            borderRadius: AppStyles.border,
            padding: AppStyles.paddingHorizontalMini,
            elevation: 1,
            alignment: Alignment.centerRight,
            value: appSettings.getThemeModeIndex,
            items: List.generate(
              locale.themes.split(', ').length,
              (index) => DropdownMenuItem<int>(
                value: index,
                child: Center(
                  child: Padding(
                    padding: AppStyles.paddingMini,
                    child: Text(
                      locale.themes.split(', ')[index],
                      style: appSettings.getThemeModeIndex == index ? itemSelectedTextStyle : AppStyles.mainTextStyle18,
                    ),
                  ),
                ),
              ),
            ),
            onChanged: (newIndex) {
              appSettings.setThemeModeIndex = newIndex!;
            },
            underline: const SizedBox(),
          ),
        );
      },
    );
  }
}
