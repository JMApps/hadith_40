import 'package:flutter/material.dart';
import 'package:hadith_40/data/database_query.dart';
import 'package:hadith_40/widgets/hadeeth_list.dart';

class BookmarkHadeethList extends StatefulWidget {
  const BookmarkHadeethList({Key? key}) : super(key: key);

  @override
  _BookmarkHadeethListState createState() => _BookmarkHadeethListState();
}

class _BookmarkHadeethListState extends State<BookmarkHadeethList> {
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: const Text(
          'Избранное',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey[700],
      ),
      body: FutureBuilder<List>(
        future: _databaseQuery.getFavoriteHadeeths(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? HadeethList(snapshot: snapshot)
              : const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Избранных хадисов нет',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
