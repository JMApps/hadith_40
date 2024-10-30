import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/data/models/arguments/apart_hadith_args.dart';
import 'package:provider/provider.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:share_plus/share_plus.dart';

import '../../../core/routes/route_page_names.dart';
import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/hadith_entity.dart';
import '../../state/content_index_state.dart';
import '../../state/hadiths_state.dart';
import '../../state/scroll_page_state.dart';
import '../../widgets/fab_to_start.dart';
import '../lists/content_page_list.dart';

class ContentHadithPage extends StatefulWidget {
  const ContentHadithPage({
    super.key,
    required this.hadithId,
  });

  final int hadithId;

  @override
  State<ContentHadithPage> createState() => _ContentHadithPageState();
}

class _ContentHadithPageState extends State<ContentHadithPage> {
  late PageController _pageController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.hadithId - 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ScrollPageState(_scrollController),
        ),
        ChangeNotifierProvider(
          create: (_) => ContentIndexState(widget.hadithId),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<ContentIndexState>(
            builder: (context, contentIndex, _) {
              return Text('${AppStrings.hadith} ${contentIndex.getContentIndex}');
            },
          ),
          actions: [
            IconButton.filledTonal(
              onPressed: () async {
                await Navigator.pushNamed(
                  context,
                  RoutePageNames.contentSettingsPage,
                );
              },
              tooltip: AppStrings.settings,
              icon: Icon(Icons.settings),
            ),
            IconButton.filledTonal(
              onPressed: () async {
                await Navigator.pushNamed(
                  context,
                  RoutePageNames.contentApartHadith,
                  arguments: ApartHadithArgs(tableName: locale.tableName, hadithId: widget.hadithId),
                );
              },
              tooltip: AppStrings.apartMode,
              icon: Icon(CupertinoIcons.layers_alt_fill),
            ),
          ],
        ),
        body: ContentPageList(pageController: _pageController, tableName: locale.tableName),
        floatingActionButton: FabTopStart(),
        bottomNavigationBar: Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: Padding(
            padding: AppStyles.bottomTopMini,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton.filled(
                  onPressed: () {
                    _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  },
                  icon: Icon(CupertinoIcons.arrow_turn_up_left),
                ),
                IconButton.filledTonal(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.play),
                ),
                IconButton.filledTonal(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.arrow_2_squarepath),
                ),
                Consumer<ContentIndexState>(
                  builder: (context, contentIndex, _) {
                    return FutureBuilder<HadithEntity>(
                      future: Provider.of<HadithsState>(context, listen: false).fetchHadithById(tableName: locale.tableName, hadithId: contentIndex.getContentIndex),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final HadithEntity hadithModel = snapshot.data!;
                          return IconButton.filledTonal(
                            onPressed: () async {
                              final shareContent = await _hadithForShare(hadithNumber: hadithModel.hadithNumber, hadithArabic: hadithModel.hadithArabic, hadithTranslation: hadithModel.hadithTranslation);
                              await Share.share(shareContent);
                            },
                            icon: Icon(CupertinoIcons.share_up),
                          );
                        }
                        return Padding(
                          padding: AppStyles.paddingHorizontalMini,
                          child: CircularProgressIndicator.adaptive(),
                        );
                      },
                    );
                  },
                ),
                IconButton.filled(
                  onPressed: () {
                    _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  },
                  icon: Icon(CupertinoIcons.arrow_turn_up_right),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<String> _hadithForShare({required String hadithNumber, required String hadithArabic, required String hadithTranslation}) async {
    final arabic = html_parser.parse(hadithArabic);
    final translation = html_parser.parse(hadithTranslation);
    return [
      hadithNumber,
      arabic.body!.text,
      translation.body!.text,
    ].join('\n\n');
  }
}
