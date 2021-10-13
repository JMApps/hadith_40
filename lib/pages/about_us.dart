import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 1,
        title: const Text(
          'О нас',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Scrollbar(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Linkify(
              text:
                  'JMApps - серия бесплатных и безрекламных андроид и iOS приложений для мусульман.\n\n'
                  'Вы можете следить за обновлением старых и изданием новых приложений в наших соцсетях:\n\n'
                  'Telegram: www.t.me/jmapps\n\n'
                  'Facebook: www.facebook.com/jmappps\n\n'
                  'Instagram: www.instagram.com/dev_muslim\n\n'
                  'UmmaLife: www.umma.life/jmapps\n\n'
                  'По всем вопросам, предложениям и скритикой можете писать нам на почту:\n\n'
                  'jmappsmuslim@gmail.com или в telegram: www.t.me/dev_muslim\n\n',
              style: const TextStyle(fontSize: 20),
              linkStyle: const TextStyle(color: Colors.red),
              onOpen: (link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                } else {
                  throw 'Could not launch $link';
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
