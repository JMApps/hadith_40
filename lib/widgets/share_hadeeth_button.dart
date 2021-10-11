import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/data/database_query.dart';
import 'package:hadith_40/model/hadeeth_item.dart';
import 'package:html/parser.dart';
import 'package:share_plus/share_plus.dart';

class ShareHadeethButton extends StatelessWidget {
  ShareHadeethButton({Key? key, required this.id}) : super(key: key);

  final int id;
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: _databaseQuery.getOneHadeeth(id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? IconButton(
                  icon: const Icon(CupertinoIcons.share),
                  onPressed: () {
                    HadeethItem item = snapshot.data![0];
                    Share.share(
                      '${item.hadeethNumber}\n\n'
                      '${item.hadeethTitle}\n\n'
                      '${_parseHtmlString(item.hadeethArabic!)}\n\n'
                      '${_parseHtmlString(item.hadeethTranslation!)}',
                      sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10),
                    );
                  },
                )
              : const Text('Ошибка получения даных');
        });
  }

  String _parseHtmlString(String htmlString) {
    final documentText = parse(htmlString);
    final String parsedString = parse(documentText.body!.text).documentElement!.text;
    return parsedString;
  }
}
