import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/domain/entities/bookmark_hadith_entity.dart';

class BookmarkHadithItem extends StatelessWidget {
  const BookmarkHadithItem({super.key, required this.model, required this.index});

  final BookmarkHadithEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color oddItemColor = appColors.primary.withOpacity(0.15);
    final Color evenItemColor = appColors.primary.withOpacity(0.05);
    return ListTile(
      onTap: () {},
      tileColor: index.isOdd ? oddItemColor : evenItemColor,
      leading: Icon(
        CupertinoIcons.bookmark,
        color: appColors.primary,
      ),
      title: Text(
        model.hadithNumber,
        style: TextStyle(
          color: appColors.primary,
          fontSize: 18,
        ),
      ),
      subtitle: Text(
        model.hadithTitle,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
