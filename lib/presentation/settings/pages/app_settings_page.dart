import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/app_settings_state.dart';
import '../widgets/about_us_list_tile.dart';
import '../widgets/app_setting_list_tile.dart';
import '../widgets/app_setting_switch.dart';
import '../widgets/app_theme_color_list_tile.dart';
import '../widgets/theme_mode_drop_down.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.settings),
      ),
      body: SingleChildScrollView(
        child: Consumer<AppSettingsState>(
          builder: (context, settingsState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppSettingListTile(
                  title: AppStrings.dailyNotifications,
                  subTitle: DateFormat('HH:mm').format(settingsState.getNotificationTime),
                  leading: IconButton(
                    onPressed: () async {
                      final notificationTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: settingsState.getNotificationTime.hour, minute: settingsState.getNotificationTime.minute),
                      );
                      if (notificationTime != null) {
                        settingsState.setNotificationTime = DateTime(2024, 12, 31, notificationTime.hour, notificationTime.minute);
                      }
                    },
                    icon: Icon(
                      Icons.access_time_rounded,
                      size: 30,
                    ),
                  ),
                  trailing: IconButton.filledTonal(
                    onPressed: () {
                      settingsState.setNotificationState = !settingsState.getNotificationState;
                    },
                    icon: Icon(
                      settingsState.getNotificationState ? Icons.notifications_on_outlined : Icons.notifications_off_outlined,
                      color: settingsState.getNotificationState ? appColors.primary : appColors.onSurface,
                      size: 30,
                    ),
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                AppSettingListTile(
                  title: AppStrings.display,
                  subTitle: AppStrings.displayAlwaysOn,
                  leading: Icon(Icons.light_mode_outlined),
                  trailing: AppSettingSwitch(
                    value: settingsState.getDisplayAlwaysOn,
                    onChanged: (onChanged) => settingsState.setDisplayAlwaysOn = onChanged,
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                AppThemeColorListTile(),
                const Divider(indent: 16, endIndent: 16),
                ThemeModeDropDown(),
                const Divider(indent: 16, endIndent: 16),
                Padding(
                  padding: AppStyles.paddingHorizontal,
                  child: Text(
                    AppStrings.ourApps,
                    style: AppStyles.mainTextStyle18Bold,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 8),
                AboutUsListTile(
                  title: Platform.isAndroid ? AppStrings.googlePlay : AppStrings.appStore,
                  subTitle: AppStrings.moreOurApps,
                  iconName: Platform.isAndroid ? 'google-play' : 'appstore',
                  link: Platform.isAndroid ? AppStrings.linkGooglePlay : AppStrings.linkAppStore,
                ),
                const Divider(indent: 16, endIndent: 16),
                const SizedBox(height: 8),
                Padding(
                  padding: AppStyles.paddingHorizontal,
                  child: Text(
                    AppStrings.ourSocials,
                    style: AppStyles.mainTextStyle18Bold,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 8),
                AboutUsListTile(
                  title: AppStrings.telegram,
                  subTitle: AppStrings.jmapps,
                  iconName: 'telegram',
                  link: AppStrings.linkTelegram,
                ),
                const SizedBox(height: 8),
                AboutUsListTile(
                  title: AppStrings.instagram,
                  subTitle: AppStrings.devMuslim,
                  iconName: 'instagram',
                  link: AppStrings.linkInstagram,
                ),
                const SizedBox(height: 8),
                AboutUsListTile(
                  title: AppStrings.ummaLife,
                  subTitle: AppStrings.jmapps,
                  iconName: 'ummalife',
                  link: AppStrings.linkUmmaLife,
                ),
                const SizedBox(height: 8),
              ],
            );
          },
        ),
      ),
    );
  }
}
