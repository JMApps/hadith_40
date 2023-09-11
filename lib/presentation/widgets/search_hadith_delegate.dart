import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/data/datasources/local/databases/database_helper.dart';
import 'package:hadith_40/data/repositories/search_list_data_repository.dart';
import 'package:hadith_40/domain/entities/search_hadith_entity.dart';
import 'package:hadith_40/domain/usecases/search_list_use_case.dart';
import 'package:hadith_40/presentation/items/search_hadith_item.dart';
import 'package:hadith_40/presentation/widgets/data_is_empty_text.dart';

class SearchHadithDelegate extends SearchDelegate {
  List<SearchHadithEntity> _chapterHadiths = [];
  List<SearchHadithEntity> _recentChapterHadiths = [];

  SearchHadithDelegate({
    required String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isNotEmpty
          ? IconButton(
              onPressed: () {
                query = '';
              },
              splashRadius: 15,
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: transitionAnimation,
              ),
            )
          : const SizedBox(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      splashRadius: 20,
      icon: const Icon(
        Icons.arrow_back_ios,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _searchFuture(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _searchFuture(context);
  }

  Widget _searchFuture(BuildContext context) {
    final DatabaseHelper databaseHelper = DatabaseHelper();
    final SearchListDataRepository searchListDataRepository = SearchListDataRepository(databaseHelper: databaseHelper);
    final SearchListUseCase searchListUseCase = SearchListUseCase(searchListRepository: searchListDataRepository);
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List>(
      future: searchListUseCase.getSearchChapterHadiths(tableName: locale.tableName),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          _chapterHadiths = snapshot.data;
          _recentChapterHadiths = query.isEmpty
              ? _chapterHadiths
              : _chapterHadiths
                  .where((element) =>
                      element.id.toString().contains(query) ||
                      element.hadithNumber.toLowerCase().contains(query.toLowerCase()) ||
                      element.hadithTitle.toLowerCase().contains(query.toLowerCase())).toList();
          return _recentChapterHadiths.isEmpty
              ? DataIsEmptyText(
                  message: locale.searchIsEmpty,
                )
              : CupertinoScrollbar(
                  child: ListView.builder(
                    itemCount: _recentChapterHadiths.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SearchHadithItem(
                        model: _recentChapterHadiths[index],
                        index: index,
                      );
                    },
                  ),
                );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
