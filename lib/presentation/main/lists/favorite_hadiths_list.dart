import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/hadith_entity.dart';
import '../../state/hadiths_state.dart';
import '../../state/scroll_page_state.dart';
import '../../widgets/favorite_is_empty.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/favorite_hadith_item.dart';

class FavoriteHadithsList extends StatefulWidget {
  const FavoriteHadithsList({
    super.key,
    required this.tableName,
  });

  final String tableName;

  @override
  State<FavoriteHadithsList> createState() => _FavoriteHadithsListState();
}

class _FavoriteHadithsListState extends State<FavoriteHadithsList> {
  late final ScrollController _scrollController;
  late Future<List<HadithEntity>> _futureFavoriteHadiths;

  @override
  void initState() {
    super.initState();
    _scrollController = Provider.of<ScrollPageState>(context, listen: false).getScrollController;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _futureFavoriteHadiths = Provider.of<HadithsState>(context, listen: false).fetchFavoriteHadiths(
      tableName: widget.tableName,
      favorites: Provider.of<HadithsState>(context).getFavoriteHadiths,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HadithEntity>>(
      future: _futureFavoriteHadiths,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Scrollbar(
            controller: _scrollController,
            child: ListView.builder(
              controller: _scrollController,
              padding: AppStyles.withoutBottomMini,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final HadithEntity hadithModel = snapshot.data![index];
                return FavoriteHadithItem(
                  hadithModel: hadithModel,
                  hadithIndex: index,
                );
              },
            ),
          );
        }
        if (snapshot.hasData && snapshot.data!.isEmpty) {
          return const FavoriteIsEmpty(
            text: AppStrings.favoriteIsEmpty,
          );
        }
        if (snapshot.hasError) {
          return MainErrorTextData(errorText: snapshot.error.toString());
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
