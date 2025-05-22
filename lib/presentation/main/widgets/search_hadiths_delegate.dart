import 'package:flutter/material.dart';

import 'search_hadith_future.dart';

class SearchHadithsDelegate extends SearchDelegate {
  SearchHadithsDelegate({
    required this.tableName,
    required this.searchLabel,
  }) : super(
          searchFieldLabel: searchLabel,
          keyboardType: TextInputType.text,
        );

  final String tableName;
  final String searchLabel;

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
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
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchHadithFuture(
      tableName: tableName,
      query: query.toLowerCase(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchHadithFuture(
      tableName: tableName,
      query: query.toLowerCase(),
    );
  }
}
