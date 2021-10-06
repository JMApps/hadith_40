import 'package:flutter/material.dart';
import 'package:hadith_40/data/database_query.dart';
import 'package:hadith_40/widgets/hadeeth_list.dart';
import 'package:hadith_40/widgets/hadeeth_searcher.dart';

class MainHadeethList extends StatefulWidget {
  const MainHadeethList({Key? key}) : super(key: key);

  @override
  _MainHadeethListState createState() => _MainHadeethListState();
}

class _MainHadeethListState extends State<MainHadeethList> {
  final _databaseQuery = DatabaseQuery();
  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          '40 хадисов',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey[700],
      ),
      body: FutureBuilder<List>(
        future: _searchTextController.text.isEmpty
            ? _databaseQuery.getAllHadeeths()
            : _databaseQuery.getSearchResult(
                _searchTextController.text.toString(),
              ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasError
              ? Center(
                  child: Text('${snapshot.error}'),
                )
              : snapshot.hasData
                  ? Column(
                      children: [
                        const HadeethSearcher(),
                        Expanded(
                          child: HadeethList(snapshot: snapshot),
                        ),
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                      ),
                    );
        },
      ),
    );
  }
}