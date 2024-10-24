import 'package:flutter/material.dart';

import '../../../core/styles/app_styles.dart';

class AppSettingListTile extends StatelessWidget {
  const AppSettingListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.leading,
    required this.trailing,
  });

  final String title;
  final String subTitle;
  final Widget leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.comfortable,
      title: Text(
        title,
        style: AppStyles.mainTextStyle18Bold,
      ),
      subtitle: Text(
        subTitle,
        style: AppStyles.mainTextStyle16,
      ),
      leading: leading,
      trailing: trailing,
    );
  }
}
