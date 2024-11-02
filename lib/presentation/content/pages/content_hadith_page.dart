import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/routes/route_page_names.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/models/arguments/apart_hadith_args.dart';
import '../../state/content_index_state.dart';
import '../../state/hadith_player_state.dart';
import '../../state/scroll_page_state.dart';
import '../../widgets/fab_to_start.dart';
import '../../widgets/share_hadith_button.dart';
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
    final appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContentIndexState(widget.hadithId),
        ),
        ChangeNotifierProvider(
          create: (_) => HadithPlayerState(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScrollPageState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<ContentIndexState>(
            builder: (context, contentIndex, _) {
              return Text('${locale.hadith} ${contentIndex.getHadithId}');
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
              tooltip: locale.settings,
              icon: Icon(Icons.settings_outlined),
            ),
            Consumer<ContentIndexState>(
              builder: (context, contentIndex, _) {
                return IconButton.filledTonal(
                  onPressed: () async {
                    Provider.of<HadithPlayerState>(context, listen: false).stopTrack();
                    await Navigator.pushNamed(
                      context,
                      RoutePageNames.contentApartHadith,
                      arguments: ApartHadithArgs(
                        tableName: locale.tableName,
                        hadithId: contentIndex.getHadithId,
                      ),
                    );
                  },
                  tooltip: locale.apartMode,
                  icon: Icon(CupertinoIcons.layers_alt),
                );
              },
            ),
          ],
        ),
        body: ContentPageList(
          pageController: _pageController,
          tableName: locale.tableName,
        ),
        floatingActionButton: FabTopStart(),
        bottomNavigationBar: Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: Consumer<HadithPlayerState>(
            builder: (context, hadithPlayer, _) {
              return Padding(
                padding: AppStyles.bottomTopMini,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.spaceEvenly,
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    IconButton.filledTonal(
                      onPressed: () async {
                        hadithPlayer.stopTrack();
                        await _pageController.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      tooltip: locale.previous,
                      icon: Icon(CupertinoIcons.arrow_turn_up_left),
                    ),
                    Consumer<ContentIndexState>(
                      builder: (context, contentIndex, _) {
                        return IconButton.filledTonal(
                          onPressed: () {
                            hadithPlayer.toggleRepeatMode();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: appColors.secondaryContainer,
                                duration: const Duration(milliseconds: 500),
                                shape: AppStyles.shapeTop,
                                elevation: 0,
                                content: Text(
                                  hadithPlayer.isRepeating ? locale.repeatOn : locale.repeatOff,
                                  style: TextStyle(
                                    color: appColors.onSurface,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ),
                            );
                          },
                          tooltip: locale.repeat,
                          icon: Icon(
                            CupertinoIcons.arrow_2_squarepath,
                            color: hadithPlayer.isRepeating ? appColors.error : appColors.onSurface,
                          ),
                        );
                      },
                    ),
                    Consumer<ContentIndexState>(
                      builder: (context, contentIndex, _) {
                        return IconButton.filledTonal(
                          onPressed: () {
                            hadithPlayer.playTrack(audioName: 'hadeeth_${contentIndex.getHadithId}', trackId: contentIndex.getHadithId);
                          },
                          icon: Icon(hadithPlayer.isPlaying ? CupertinoIcons.pause : CupertinoIcons.play),
                        );
                      },
                    ),
                    ShareHadithButton(),
                    IconButton.filledTonal(
                      onPressed: () async {
                        hadithPlayer.stopTrack();
                        await _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      tooltip: locale.next,
                      icon: Icon(CupertinoIcons.arrow_turn_up_right),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
