import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/content_settings_state.dart';

class DefaultSettingsButton extends StatelessWidget {
  const DefaultSettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () {
        Provider.of<ContentSettingsState>(context, listen: false).setDefault();
      },
      child: Text(
        AppStrings.defaultSettings,
        style: AppStyles.mainTextStyle18,
      ),
    );
  }
}
