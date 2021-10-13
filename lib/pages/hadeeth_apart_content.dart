import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/data/database_query.dart';
import 'package:hadith_40/model/hadeeth_argument.dart';
import 'package:hadith_40/provider/apart_player_state.dart';
import 'package:hadith_40/widgets/apart_player.dart';
import 'package:hadith_40/widgets/hadeeth_apart_list_item.dart';
import 'package:hadith_40/widgets/hadeeth_content_title.dart';
import 'package:hadith_40/widgets/hadeeth_settings.dart';
import 'package:hadith_40/widgets/share_hadeeth_button.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HadeethApartContent extends StatefulWidget {
  const HadeethApartContent({Key? key}) : super(key: key);

  @override
  _HadeethApartContentState createState() => _HadeethApartContentState();
}

class _HadeethApartContentState extends State<HadeethApartContent> {
  final _databaseQuery = DatabaseQuery();
  final _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HadeethArgument;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ApartPlayerState>(
            create: (_) => ApartPlayerState()),
      ],
      child: FutureBuilder<List>(
        future: _databaseQuery.getApartHadeeth(args.id!),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasError
              ? Center(
                  child: Text('${snapshot.error}'),
                )
              : snapshot.hasData
                  ? Scaffold(
                      appBar: AppBar(
                        iconTheme: const IconThemeData(
                          color: Colors.white,
                        ),
                        centerTitle: true,
                        elevation: 0,
                        title: Text(
                          '${args.hadeethNumber}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.purple[800],
                        actions: [
                          IconButton(
                            onPressed: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) {
                                  return const HadeethSettings();
                                },
                              );
                            },
                            icon: const Icon(
                              CupertinoIcons.settings,
                              color: Colors.white,
                            ),
                          ),
                          ShareHadeethButton(id: args.id!),
                        ],
                      ),
                      body: Column(
                        children: [
                          HadeethContentTitle(
                            hadeethTitle: args.hadeethTitle!,
                            backgroundColor: Colors.purple[800]!,
                            textColor: Colors.white,
                            borderRadius: 50,
                          ),
                          Expanded(
                            child: Scrollbar(
                              thickness: 5,
                              isAlwaysShown: true,
                              showTrackOnHover: true,
                              child: ScrollablePositionedList.separated(
                                itemScrollController: context
                                    .read<ApartPlayerState>()
                                    .getItemScrollController,
                                padding: EdgeInsets.zero,
                                itemCount: snapshot.data!.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return HadeethApartListItem(
                                    item: snapshot.data[index],
                                    index: index,
                                    player: _assetsAudioPlayer,
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const Divider();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      bottomNavigationBar: Container(
                        padding: const EdgeInsets.only(bottom: 16),
                        height: 66,
                        decoration: BoxDecoration(
                          color: Colors.purple[800],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                          ),
                        ),
                        child: ApartPlayer(
                            snapshot: snapshot, player: _assetsAudioPlayer),
                      ),
                    )
                  : const Center(
                      child: CupertinoActivityIndicator(),
                    );
        },
      ),
    );
  }
}
