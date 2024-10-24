import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/hadith_entity.dart';
import '../../state/hadiths_state.dart';
import '../../state/scroll_page_state.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/main_hadith_item.dart';

class MainHadithsList extends StatefulWidget {
  const MainHadithsList({
    super.key,
    required this.tableName,
  });

  final String tableName;

  @override
  State<MainHadithsList> createState() => _MainHadithsListState();
}

class _MainHadithsListState extends State<MainHadithsList> {
  late ScrollController _scrollController;
  late Future<List<HadithEntity>> _futureHadiths;

  @override
  void initState() {
    super.initState();
    _scrollController = Provider.of<ScrollPageState>(context, listen: false).getScrollController;
    _futureHadiths = Provider.of<HadithsState>(context, listen: false).fetchAllHadiths(tableName: widget.tableName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HadithEntity>>(
      future: _futureHadiths,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scrollbar(
            controller: _scrollController,
            child: ListView.builder(
              controller: _scrollController,
              padding: AppStyles.withoutBottomMini,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final HadithEntity hadithModel = snapshot.data![index];
                return MainHadithItem(
                  hadithModel: hadithModel,
                  hadithIndex: index,
                );
              },
            ),
          );
        }
        if (snapshot.hasError) {
          return MainErrorTextData(errorText: snapshot.error.toString());
        }
        return Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
