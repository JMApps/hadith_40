import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/data/datasources/state/toggle_bookmark_state.dart';
import 'package:hadith_40/domain/entities/chapter_hadith_entity.dart';
import 'package:provider/provider.dart';

class MainHadithItem extends StatelessWidget {
  const MainHadithItem({
    super.key,
    required this.model,
    required this.index,
  });

  final ChapterHadithEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color oddItemColor = appColors.primary.withOpacity(0.15);
    final Color evenItemColor = appColors.primary.withOpacity(0.05);
    final ToggleBookmarkState hadithsState = Provider.of<ToggleBookmarkState>(context);
    final bool isBookmark = hadithsState.isBookmarks(hadithId: model.id);
    return ListTile(
      onTap: () {
        hadithsState.toggleBookmarks(hadithId: model.id);
      },
      tileColor: index.isOdd ? oddItemColor : evenItemColor,
      leading: Icon(
        isBookmark ? CupertinoIcons.bookmark_solid : CupertinoIcons.bookmark,
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
