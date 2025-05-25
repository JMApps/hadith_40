import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/hadith_entity.dart';
import '../../state/play_list_state.dart';
import '../../widgets/main_html_data.dart';

class PlayListItem extends StatelessWidget {
  const PlayListItem({
    super.key,
    required this.hadithModel,
    required this.index,
  });

  final HadithEntity hadithModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Consumer<PlayListState>(
      builder: (context, player, _) {
        return ListTile(
          tileColor: player.currentIndex == index && player.player.playing ? appColors.primary.withAlpha(25) : appColors.surface,
          onTap: () {
            player.playAt(index);
          },
          horizontalTitleGap: 0,
          visualDensity: VisualDensity.compact,
          title: Text(
            hadithModel.hadithNumber,
            style: TextStyle(
              fontSize: 18.0,
              color: appColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            hadithModel.hadithTitle,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => SingleChildScrollView(
                  padding: AppStyles.withoutTop,
                  child: MainHtmlData(
                    htmlData: hadithModel.hadithArabic,
                    font: AppConstraints.fontHafs,
                    fontSize: 20.0,
                    textAlign: TextAlign.center,
                    fontColor: appColors.onSurface,
                    textDirection: TextDirection.rtl,
                    textHeight: 3.0,
                  ),
                ),
              );
            },
            icon: Icon(Icons.text_fields_rounded),
          ),
        );
      },
    );
  }
}
