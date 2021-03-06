import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/data/database_query.dart';
import 'package:hadith_40/provider/bookmark_state.dart';
import 'package:hadith_40/provider/search_data.dart';
import 'package:hadith_40/widgets/hadeeth_list.dart';
import 'package:hadith_40/widgets/hadeeth_searcher.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MainHadeethList extends StatelessWidget {
  MainHadeethList({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    FocusScopeNode _currentKeyBoardFocus = FocusScope.of(context);
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            '40 хадисов',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.grey[800],
          actions: [
            IconButton(
              icon: const Icon(
                Icons.apps,
                color: Colors.white,
              ),
              onPressed: () async {
                if (await canLaunch(
                    'https://apps.apple.com/ru/developer/imanil-binyaminov/id1564920953')) {
                  await launch(
                      'https://apps.apple.com/ru/developer/imanil-binyaminov/id1564920953');
                } else {
                  throw 'Could not launch';
                }
              },
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.info,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/about_us');
              },
            ),
          ],
        ),
        body: Column(
          children: [
            const HadeethSearcher(),
            Expanded(
              child: FutureBuilder<List>(
                future:
                    context.watch<SearchData>().getTextFieldText.isNotEmpty ||
                            context.watch<BookmarkState>().getUpdateList
                        ? _databaseQuery.getSearchResult(
                            context.watch<SearchData>().getTextFieldText)
                        : _databaseQuery.getAllHadeeths(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return snapshot.hasError
                      ? const Center(
                          child: Text(
                            'По вашему запросу ничего не найдено',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      : snapshot.hasData
                          ? HadeethList(snapshot: snapshot)
                          : const Center(
                              child: CupertinoActivityIndicator(),
                            );
                },
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        if (!_currentKeyBoardFocus.hasPrimaryFocus) {
          _currentKeyBoardFocus.unfocus();
        }
      },
    );
  }
}
