import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/app_settings_state.dart';
import 'app_setting_list_tile.dart';

class AppThemeColorListTile extends StatelessWidget {
  const AppThemeColorListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Consumer<AppSettingsState>(
      builder: (context, settingsState, _) {
        return AppSettingListTile(
          title: locale.themeColor,
          subTitle: locale.selectThemeColor,
          leading: Icon(Icons.color_lens_outlined),
          trailing: IconButton.filledTonal(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  alignment: Alignment.center,
                  actionsPadding: AppStyles.paddingMini,
                  title: Text(
                    locale.themeColor,
                    style: AppStyles.mainTextStyle18Bold,
                  ),
                  content: Material(
                    color: Colors.transparent,
                    child: MaterialColorPicker(
                      alignment: WrapAlignment.center,
                      iconSelected: Icons.check_circle,
                      elevation: 0.5,
                      colors: [
                        Colors.red,
                        Colors.purple,
                        Colors.blueGrey,
                        Colors.blue,
                        Colors.yellow,
                        Colors.grey,
                        Colors.orange,
                        Colors.teal,
                        Colors.green,
                        Colors.brown,
                        Colors.cyan,
                        Colors.lime,
                        Colors.pink,
                        Colors.indigo,
                        Colors.amber,
                      ],
                      allowShades: false,
                      onMainColorChange: (Color? color) => settingsState.setAppThemeColor = color!.toARGB32(),
                      selectedColor: Color(settingsState.getAppThemeColor),
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
