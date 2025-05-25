import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/styles/app_styles.dart';

class AboutUsListTile extends StatelessWidget {
  const AboutUsListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.iconName,
    required this.link,
  });

  final String title;
  final String subTitle;
  final String iconName;
  final String link;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        await _launchUrl();
      },
      splashColor: Theme.of(context).colorScheme.primary.withAlpha(75),
      shape: AppStyles.shape,
      title: Text(
        title,
        style: AppStyles.mainTextStyle18Bold,
      ),
      subtitle: Text(
        subTitle,
        style: AppStyles.mainTextStyle18,
      ),
      leading: Image.asset(
        'assets/pictures/$iconName.png',
        width: 35,
        height: 35,
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
    );
  }

  Future<void> _launchUrl() async {
    final Uri urlLink = Uri.parse(link);
    await launchUrl(urlLink);
  }
}
