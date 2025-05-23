import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../l10n/app_localizations.dart';

import '../../../core/routes/route_page_names.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/models/arguments/card_hadith_args.dart';
import '../../state/apart_hadith_player_state.dart';
import '../../state/apart_hadiths_state.dart';
import '../lists/content_apart_hadiths_list.dart';

class ContentApartHadithPage extends StatefulWidget {
  const ContentApartHadithPage({
    super.key,
    required this.tableName,
    required this.hadithId,
  });

  final String tableName;
  final int hadithId;

  @override
  State<ContentApartHadithPage> createState() => _ContentApartHadithPageState();
}

class _ContentApartHadithPageState extends State<ContentApartHadithPage> {
  late final Future<List<String>> _futureTrackList;

  @override
  void initState() {
    super.initState();
    _futureTrackList = Provider.of<ApartHadithsState>(context, listen: false).fetchTrackList(hadithId: widget.hadithId);
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ApartHadithPlayerState(futureTrackList: _futureTrackList),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('${locale.hadith} ${widget.hadithId}'),
          actions: [
            IconButton(
              onPressed: () async {
                await Navigator.pushNamed(
                  context,
                  RoutePageNames.contentSettingsPage,
                );
              },
              tooltip: locale.settings,
              icon: Icon(Icons.settings),
            ),
            Visibility(
              visible: locale.localeName.contains('ru'),
              child: Consumer<ApartHadithPlayerState>(
                builder: (context, apartHadithPlayer, _) {
                  return IconButton(
                    onPressed: () async {
                      apartHadithPlayer.stopTrack();
                      await Navigator.pushNamed(
                        context,
                        RoutePageNames.contentCardHadithPage,
                        arguments: CardHadithArgs(
                          tableName: locale.tableName,
                          hadithId: widget.hadithId,
                        ),
                      );
                    },
                    tooltip: locale.cardsMode,
                    icon: Icon(Icons.credit_card_rounded),
                  );
                },
              ),
            ),
          ],
        ),
        body: ContentApartHadithsList(
          tableName: locale.apartTableName,
          hadithId: widget.hadithId,
        ),
        bottomNavigationBar: Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: Consumer<ApartHadithPlayerState>(
            builder: (context, hadithPlayer, _) {
              return Padding(
                padding: AppStyles.bottomTopMini,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.spaceEvenly,
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    IconButton.outlined(
                      onPressed: hadithPlayer.isPlaying ? () {
                        hadithPlayer.previousTrack();
                      } : null,
                      icon: Icon(CupertinoIcons.arrow_up),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        hadithPlayer.playTrack();
                      },
                      icon: Icon(hadithPlayer.isPlaying ? CupertinoIcons.pause : CupertinoIcons.play),
                    ),
                    IconButton.filledTonal(
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
                      icon: Icon(
                        CupertinoIcons.arrow_2_squarepath,
                        color: hadithPlayer.isRepeating ? appColors.error : appColors.onSurface,
                      ),
                    ),
                    IconButton.outlined(
                      onPressed: hadithPlayer.isPlaying ? () {
                        hadithPlayer.nextTrack();
                      } : null,
                      icon: Icon(CupertinoIcons.arrow_down),
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
