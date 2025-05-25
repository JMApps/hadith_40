import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../../l10n/app_localizations.dart';
import '../settings/widgets/about_us_list_tile.dart';

class OurAppsBottomSheet extends StatelessWidget {
  const OurAppsBottomSheet({
    super.key,
    required this.isNewVersion,
  });

  final bool isNewVersion;

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: AppStyles.withoutTop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            locale.useOtherOurApps,
            style: AppStyles.mainTextStyle18,
            textAlign: TextAlign.center,
          ),
          AboutUsListTile(
            title: locale.shelfMuslim,
            subTitle: locale.shelfMuslim,
            iconName: Platform.isAndroid ? 'google-play' : 'appstore',
            link: Platform.isAndroid ? AppStrings.shelfMuslimAndroid : AppStrings.shelfMuslimIOS,
          ),
          AboutUsListTile(
            title: locale.fortressMuslim,
            subTitle: locale.fortressMuslim,
            iconName: Platform.isAndroid ? 'google-play' : 'appstore',
            link: Platform.isAndroid ? AppStrings.fortressMuslimAndroid : AppStrings.fortressMuslimIOS,
          ),
        ],
      ),
    );
  }
}
