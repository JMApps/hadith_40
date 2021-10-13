import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hadith_40/model/hadeeth_apart_item.dart';
import 'package:hadith_40/provider/hadeeth_settings_state.dart';
import 'package:hadith_40/provider/main_player_state.dart';
import 'package:provider/provider.dart';

class HadeethApartListItem extends StatelessWidget {
  const HadeethApartListItem({
    Key? key,
    required this.item,
    required this.index,
    required this.player,
  }) : super(key: key);

  final HadeethApartItem item;
  final int index;
  final AssetsAudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.watch<MainPlayerState>().getCurrentIndex == index
          ? Colors.purple[50]
          : Colors.white,
      child: ListTile(
        title: Text(
          '${item.hadeethArabic}',
          style: TextStyle(
              fontSize:
                  context.watch<HadeethSettingsState>().getTextSizeCount + 3,
              fontFamily: 'Arabic',
              color: context.watch<HadeethSettingsState>().getArabicColor),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.start,
        ),
        subtitle: Html(
          data: '${item.hadeethTranslation}',
          style: {
            '#': Style(
                fontSize: FontSize(
                    context.watch<HadeethSettingsState>().getTextSizeCount),
                textAlign: TextAlign.end,
                color:
                    context.watch<HadeethSettingsState>().getTranslationColor),
          },
        ),
        onTap: () {
          context.read<MainPlayerState>().setCurrentIndex(index);
          context.read<MainPlayerState>().playOnly(player);
        },
      ),
    );
  }
}
