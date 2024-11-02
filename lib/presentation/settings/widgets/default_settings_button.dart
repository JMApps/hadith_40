import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/content_settings_state.dart';

class DefaultSettingsButton extends StatelessWidget {
  const DefaultSettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FilledButton.tonal(
      onPressed: () {
        Provider.of<ContentSettingsState>(context, listen: false).setDefault();
      },
      child: Text(
        locale.defaultSettings,
        style: AppStyles.mainTextStyle18,
      ),
    );
  }
}
