import 'package:flutter/material.dart';
import 'package:hadith_40/core/styles/app_styles.dart';
import 'package:hadith_40/presentation/widgets/social_item.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('О нас'),
      ),
      body: const SingleChildScrollView(
        padding: AppStyles.mainMarding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Наши приложения',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
              textAlign: TextAlign.start,
            ),
            SocialItem(
              name: 'Google Play',
              description: 'Наши приложения в Google Play',
              iconName: 'google-play',
              link: 'https://play.google.com/store/apps/dev?id=8649252597553656018',
            ),
            SocialItem(
              name: 'App Store',
              description: 'Наши приложения в App Store',
              iconName: 'app-store',
              link: 'https://apps.apple.com/ru/developer/imanil-binyaminov/id1564920953',
            ),
            Text(
              'Мы в социальных сетях',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
              textAlign: TextAlign.start,
            ),
            SocialItem(
              name: 'Instagram',
              description: '@dev_muslim',
              iconName: 'instagram',
              link: 'https://www.instagram.com/dev_muslimr',
            ),
            SocialItem(
              name: 'Telegram',
              description: '@jmapps',
              iconName: 'telegram',
              link: 'https://t.me/jmapps',
            ),
            SocialItem(
              name: 'Facebook',
              description: '@jmappps',
              iconName: 'facebook',
              link: 'https://www.facebook.com/jmappps',
            ),
            SocialItem(
              name: 'GMail',
              description: 'jmappsmuslim@gmail.com',
              iconName: 'gmail',
              link: 'https://www.gmail.com',
            ),
          ],
        ),
      ),
    );
  }
}
