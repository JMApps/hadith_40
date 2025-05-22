import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_constraints.dart';
import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/services/notification/notification_service.dart';
import '../../../l10n/app_localizations.dart';
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
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final timeFormatter = DateFormat('HH:mm', Localizations.localeOf(context).languageCode);
    final itemSelectedTextStyle = TextStyle(fontSize: 16, fontFamily: AppConstraints.fontGilroy, color: appColors.primary, fontWeight: FontWeight.bold);
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<AppSettingsState>(
          builder: (context, settingsState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Divider(indent: 16, endIndent: 16),
                AppSettingListTile(
                  title: locale.dailyNotifications,
                  subTitle: timeFormatter.format(settingsState.getNotificationTime),
                  leading: IconButton(
                    onPressed: () async {
                      final notificationTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(
                          hour: settingsState.getNotificationTime.hour,
                          minute: settingsState.getNotificationTime.minute,
                        ),
                      );
                      if (notificationTime != null) {
                        final newNotificationTime = DateTime(2024, 12, 31, notificationTime.hour, notificationTime.minute);
                        settingsState.setNotificationTime = newNotificationTime;
                        if (settingsState.getNotificationState) {
                          NotificationService().timeNotifications(id: NotificationService.dailyNotificationId, title: locale.notificationTitle, body: locale.notificationBody, dateTime: settingsState.getNotificationTime);
                        }
                      }
                    },
                    icon: Icon(
                      Icons.access_time_rounded,
                      size: 30,
                      color: appColors.primary,
                    ),
                  ),
                  trailing: IconButton.filledTonal(
                    onPressed: () {
                      settingsState.setNotificationState = !settingsState.getNotificationState;
                      settingsState.getNotificationState ? NotificationService().timeNotifications(id: NotificationService.dailyNotificationId, title: locale.notificationTitle, body: locale.notificationBody, dateTime: settingsState.getNotificationTime) : NotificationService().cancelNotificationWithId(NotificationService.dailyNotificationId);
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
                  title: locale.interfaceLang,
                  subTitle: locale.changeLang,
                  leading: const Icon(Icons.language_rounded),
                  trailing: DropdownButton<int>(
                    iconEnabledColor: appColors.primary,
                    borderRadius: AppStyles.border,
                    padding: AppStyles.paddingHorizontalMini,
                    elevation: 1,
                    alignment: Alignment.centerRight,
                    value: settingsState.getLocaleIndex,
                    items: List.generate(
                      AppConstraints.appLanguages.length,
                      (index) => DropdownMenuItem<int>(
                        value: index,
                        child: Center(
                          child: Padding(
                            padding: AppStyles.paddingMini,
                            child: Text(
                              AppConstraints.appLanguages[index],
                              style: settingsState.getLocaleIndex == index ? itemSelectedTextStyle : AppStyles.mainTextStyle18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onChanged: (newIndex) {
                      settingsState.setLocaleIndex = newIndex!;
                    },
                    underline: const SizedBox(),
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                AppSettingListTile(
                  title: locale.display,
                  subTitle: locale.displayAlwaysOn,
                  leading: const Icon(Icons.light_mode_rounded),
                  trailing: AppSettingSwitch(
                    value: settingsState.getDisplayAlwaysOn,
                    onChanged: (onChanged) => settingsState.setDisplayAlwaysOn = onChanged,
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                const ThemeModeDropDown(),
                const AppThemeColorListTile(),
                const Divider(indent: 16, endIndent: 16),
                _sectionHeader(locale.ourApps),
                AboutUsListTile(
                  title: Platform.isAndroid ? AppStrings.googlePlay : AppStrings.appStore,
                  subTitle: locale.moreOurApps,
                  iconName: Platform.isAndroid ? 'google-play' : 'appstore',
                  link: Platform.isAndroid ? AppStrings.linkGooglePlay : AppStrings.linkAppStore,
                ),
                const Divider(indent: 16, endIndent: 16),
                _sectionHeader(locale.ourSocials),
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

  Widget _sectionHeader(String title) {
    return Padding(
      padding: AppStyles.paddingHorizontal,
      child: Text(
        title,
        style: AppStyles.mainTextStyle18Bold,
        textAlign: TextAlign.start,
      ),
    );
  }
}
