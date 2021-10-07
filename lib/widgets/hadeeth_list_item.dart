import 'package:flutter/material.dart';
import 'package:hadith_40/data/database_query.dart';
import 'package:hadith_40/model/hadeeth_argument.dart';
import 'package:hadith_40/model/hadeeth_item.dart';

class HadeethListItem extends StatefulWidget {
  const HadeethListItem({Key? key, required this.item}) : super(key: key);

  final HadeethItem item;

  @override
  _HadeethListItemState createState() => _HadeethListItemState();
}

class _HadeethListItemState extends State<HadeethListItem> {
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(
          widget.item.favoriteState == 0
              ? Icons.bookmark_border
              : Icons.bookmark,
          size: 25,
          color: Colors.blue,
        ),
        onPressed: () {
          setState(() {
            _databaseQuery.addRemoveFavorite(
                widget.item.favoriteState == 0 ? 1 : 0, widget.item.id!);
          });
        },
      ),
      title: Text(
        '${widget.item.hadeethNumber}',
        style: const TextStyle(
          fontSize: 18,
          color: Colors.blue,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        '${widget.item.hadeethTitle}',
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/hadeeth_content',
          arguments: HadeethArgument(
            widget.item.id,
            widget.item.hadeethNumber,
          ),
        );
      },
    );
  }
}
