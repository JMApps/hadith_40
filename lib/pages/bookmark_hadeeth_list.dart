import 'package:flutter/material.dart';

class BookmarkHadeethList extends StatefulWidget {
  const BookmarkHadeethList({Key? key}) : super(key: key);

  @override
  _BookmarkHadeethListState createState() => _BookmarkHadeethListState();
}

class _BookmarkHadeethListState extends State<BookmarkHadeethList> {
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
      body: Container(
        color: Colors.grey[200],
      ),
    );
  }
}
