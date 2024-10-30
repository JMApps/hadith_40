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
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
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
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    shape: AppStyles.shape,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 8),
                        const Divider(indent: 16, endIndent: 16),
                        Container(
                          margin: AppStyles.withoutBottomMini,
                          padding: AppStyles.paddingMini,
                          decoration: BoxDecoration(
                            borderRadius: AppStyles.borderMini,
                            color: appColors.inversePrimary,
                          ),
                          child: Text(
                            hadithModel.hadithTitle,
                            style: AppStyles.mainTextStyle18Bold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Divider(indent: 16, endIndent: 16),
                        ContentItem(
                          hadithModel: hadithModel,
                          contentIndex: index,
                        ),
                      ],
                    ),
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
