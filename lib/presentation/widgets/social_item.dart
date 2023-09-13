import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialItem extends StatelessWidget {
  const SocialItem({
    super.key,
    required this.name,
    required this.description,
    required this.iconName,
    required this.link,
  });

  final String name;
  final String description;
  final String iconName;
  final String link;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () {
        _launchUrl();
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
      ),
      subtitle: Text(
        description,
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Roboto',
          color: appColors.onBackground,
        ),
      ),
      leading: Image.asset(
        'assets/pictures/$iconName.png',
        width: 40,
        height: 40,
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri urlLink = Uri.parse(link);
    await launchUrl(urlLink);
  }
}
