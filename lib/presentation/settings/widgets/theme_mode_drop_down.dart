import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_constraints.dart';
import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/app_settings_state.dart';

class ThemeModeDropDown extends StatelessWidget {
  const ThemeModeDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final itemSelectedTextStyle = TextStyle(fontSize: 16, fontFamily: AppConstraints.fontGilroy, color: appColors.primary, fontWeight: FontWeight.bold);
    return Consumer<AppSettingsState>(
      builder: (BuildContext context, appSettings, _) {
        return ListTile(
          visualDensity: VisualDensity.comfortable,
          title: Text(
            AppStrings.theme,
            style: AppStyles.mainTextStyle18Bold,
          ),
          subtitle: Text(
            AppStrings.themeApp,
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
              AppStrings.themeModeNames.length,
              (index) => DropdownMenuItem<int>(
                value: index,
                child: Center(
                  child: Padding(
                    padding: AppStyles.paddingRightMini,
                    child: Text(
                      AppStrings.themeModeNames[index],
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