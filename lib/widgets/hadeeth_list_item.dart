import 'package:flutter/material.dart';
import 'package:hadith_40/model/hadeeth_argument.dart';
import 'package:hadith_40/model/hadeeth_item.dart';
import 'package:hadith_40/provider/bookmark_state.dart';
import 'package:provider/provider.dart';

class HadeethListItem extends StatelessWidget {
  const HadeethListItem({Key? key, required this.item}) : super(key: key);

  final HadeethItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Consumer<BookmarkState>(
        builder: (context, provider, _) => IconButton(
          icon: Icon(
            item.favoriteState == 0 ? Icons.bookmark_border : Icons.bookmark,
            size: 25,
            color: Colors.grey[700],
          ),
          onPressed: () {
            provider.updateBookmarkState(
                item.favoriteState == 0 ? 1 : 0, item.id!);
            _showSnackBar(context);
          },
        ),
      ),
      title: Text(
        '${item.hadeethNumber}',
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey[700],
          fontWeight: FontWeight.w900,
        ),
      ),
      subtitle: Text(
        '${item.hadeethTitle}',
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/hadeeth_content',
          arguments: HadeethArgument(
            item.id,
            item.hadeethNumber,
            item.hadeethTitle,
          ),
        );
      },
    );
  }

  _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:
            item.favoriteState == 0 ? Colors.grey[700] : Colors.red,
        content: item.favoriteState == 0
            ? const Text(
                'Добавлено',
                style: TextStyle(fontSize: 18),
              )
            : const Text(
                'Удалено',
                style: TextStyle(fontSize: 18),
              ),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
