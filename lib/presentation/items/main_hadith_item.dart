import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/core/routes/route_page_names.dart';
import 'package:hadith_40/data/models/arguments/content_hadith_args.dart';
import 'package:hadith_40/data/repositories/state/toggle_bookmark_state.dart';
import 'package:hadith_40/domain/entities/chapter_hadith_entity.dart';
import 'package:hadith_40/domain/usecases/toggle_bookmark_use_case.dart';
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
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ToggleBookmarkUseCase bookmarkUseCase = ToggleBookmarkUseCase(bookmarkHadithsRepository: Provider.of<ToggleBookmarkState>(context));
    final bool isBookmark = bookmarkUseCase.isBookmark(hadithId: model.id);
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutePageNames.pageContentHadithName,
          arguments: ContentHadithArgs(hadithId: model.id),
        );
      },
      tileColor: index.isOdd ? oddItemColor : evenItemColor,
      leading: IconButton(
        onPressed: () {
          bookmarkUseCase.toggleBookmark(hadithId: model.id);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: appColors.inversePrimary,
              duration: const Duration(milliseconds: 250),
              content: Text(
                isBookmark ? locale.removed : locale.added,
                style: TextStyle(
                  fontSize: 18,
                  color: appColors.primary,
                ),
              ),
            ),
          );
        },
        tooltip: locale.bookmarks,
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
