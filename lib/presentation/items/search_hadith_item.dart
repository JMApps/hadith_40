import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/core/themes/app_theme.dart';
import 'package:hadith_40/data/datasources/state/toggle_bookmark_state.dart';
import 'package:hadith_40/domain/entities/search_hadith_entity.dart';
import 'package:provider/provider.dart';

class SearchHadithItem extends StatelessWidget {
  const SearchHadithItem({
    super.key,
    required this.model,
    required this.index,
  });

  final SearchHadithEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color oddItemColor = appColors.primary.withOpacity(0.15);
    final Color evenItemColor = appColors.primary.withOpacity(0.05);
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ToggleBookmarkState hadithsState = Provider.of<ToggleBookmarkState>(context);
    final bool isBookmark = hadithsState.isBookmarks(hadithId: model.id);
    return ListTile(
      onTap: () {},
      tileColor: index.isOdd ? oddItemColor : evenItemColor,
      leading: IconButton(
        onPressed: () {
          hadithsState.toggleBookmarks(hadithId: model.id);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: appColors.inversePrimary,
              duration: const Duration(milliseconds: 250),
              content: Text(
                isBookmark ? locale.removed : locale.added,
                style: TextStyle(
                  fontSize: 18,
                  color: appColors.mainDefault,
                ),
              ),
            ),
          );
        },
        icon: Icon(
          isBookmark ? CupertinoIcons.bookmark_solid : CupertinoIcons.bookmark,
        ),
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
