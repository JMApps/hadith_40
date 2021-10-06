import 'package:flutter/material.dart';
import 'package:hadith_40/data/database_query.dart';
import 'package:hadith_40/model/hadeeth_item.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key, required this.item}) : super(key: key);

  final HadeethItem item;

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.item.favoriteState == 0 ? Icons.bookmark_border : Icons.bookmark,
        size: 25,
        color: Colors.blue,
      ),
      onPressed: () {
        setState(() {
          _databaseQuery.addRemoveFavorite(widget.item.favoriteState == 0 ? 1 : 0, widget.item.id!);
        });
      },
    );
  }
}
