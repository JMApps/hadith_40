import 'package:flutter/material.dart';
import 'package:hadith_40/model/hadeeth_argument.dart';
import 'package:hadith_40/model/hadeeth_item.dart';
import 'package:hadith_40/widgets/favorite_button.dart';

class HadeethListItem extends StatefulWidget {
  const HadeethListItem({Key? key, required this.item}) : super(key: key);

  final HadeethItem item;

  @override
  _HadeethListItemState createState() => _HadeethListItemState();
}

class _HadeethListItemState extends State<HadeethListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FavoriteButton(
          item: widget.item),
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
        Navigator.of(context, rootNavigator: true).pushNamed(
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
