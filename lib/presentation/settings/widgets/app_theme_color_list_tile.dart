import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/app_settings_state.dart';
import 'app_setting_list_tile.dart';

class AppThemeColorListTile extends StatelessWidget {
  const AppThemeColorListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettingsState>(
      builder: (context, settingsState, _) {
        return AppSettingListTile(
          title: AppStrings.themeColor,
          subTitle: AppStrings.selectThemeColor,
          leading: Icon(Icons.color_lens_outlined),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  alignment: Alignment.center,
                  actionsPadding: AppStyles.paddingMini,
                  title: Text(
                    AppStrings.themeColor,
                    style: AppStyles.mainTextStyle18Bold,
                  ),
                  content: Material(
                    color: Colors.transparent,
                    child: MaterialColorPicker(
                      alignment: WrapAlignment.center,
                      iconSelected: Icons.check_circle,
                      elevation: 0.5,
                      allowShades: false,
                      onMainColorChange: (Color? color) => settingsState.setAppThemeColor = color!.value,
                      selectedColor: Color(settingsState.getAppThemeColor),
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        AppStrings.close,
                        style: AppStyles.mainTextStyle18,
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(
              Icons.circle,
              color: Color(settingsState.getAppThemeColor),
              size: 35,
            ),
          ),
        );
      },
    );
  }
}
