import 'package:flutter/material.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../widgets/default_settings_button.dart';
import '../widgets/text_aligns_drop_down.dart';
import '../widgets/text_colors.dart';
import '../widgets/text_fonts_drop_down.dart';
import '../widgets/text_sizes_drop_down.dart';

class ContentSettingsPage extends StatelessWidget {
  const ContentSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.settings),
      ),
      body: const SingleChildScrollView(
        padding: AppStyles.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFontsDropDown(),
            TextSizesDropDown(),
            TextAlignsDropDown(),
            TextColors(),
            DefaultSettingsButton(),
          ],
        ),
      ),
    );
  }
}
