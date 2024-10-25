import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/hadith_entity.dart';
import '../../state/content_index_state.dart';
import '../../state/hadiths_state.dart';
import '../../state/scroll_page_state.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/content_item.dart';

class ContentPageList extends StatefulWidget {
  const ContentPageList({
    super.key,
    required this.pageController,
    required this.tableName,
  });

  final PageController pageController;
  final String tableName;
  @override
  State<ContentPageList> createState() => _ContentPageListState();
}

class _ContentPageListState extends State<ContentPageList> {
  late final ScrollController _scrollController;
  late final Future<List<HadithEntity>> _futureHadiths;

  @override
  void initState() {
    super.initState();
    _scrollController = Provider.of<ScrollPageState>(context, listen: false).getScrollController;
    _futureHadiths = Provider.of<HadithsState>(context, listen: false).fetchAllHadiths(tableName: widget.tableName);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HadithEntity>>(
      future: _futureHadiths,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PageView.builder(
            controller: widget.pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final HadithEntity hadithModel = snapshot.data![index];
              return Scrollbar(
                controller: _scrollController,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: AppStyles.paddingMini,
                  child: ContentItem(
                    hadithModel: hadithModel,
                    contentIndex: index,
                  ),
                ),
              );
            },
            onPageChanged: (int pageIndex) {
              Provider.of<ContentIndexState>(context, listen: false).setContentIndex = pageIndex + 1;
            },
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
