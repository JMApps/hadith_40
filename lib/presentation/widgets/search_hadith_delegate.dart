import 'package:flutter/material.dart';
import 'package:hadith_40/presentation/widgets/search_future.dart';

class SearchHadithDelegate extends SearchDelegate {
  SearchHadithDelegate({
    required String hintText,
  }) : super(searchFieldLabel: hintText, keyboardType: TextInputType.text);

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
    return SearchFuture(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchFuture(query: query);
  }
}
