import 'package:flutter/material.dart';
import 'package:hadith_40/domain/entities/apart_hadith_entity.dart';
import 'package:hadith_40/presentation/uistate/apart_player_state.dart';
import 'package:hadith_40/presentation/widgets/content_arabic_html_text.dart';
import 'package:hadith_40/presentation/widgets/content_html_text.dart';
import 'package:provider/provider.dart';

class ApartHadithItem extends StatelessWidget {
  const ApartHadithItem({
    super.key,
    required this.model,
    required this.index,
  });

  final ApartHadithEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color oddItemColor = appColors.primary.withOpacity(0.15);
    final Color evenItemColor = appColors.primary.withOpacity(0.05);
    return Consumer<ApartPlayerState>(
      builder: (BuildContext context, apartPlayer, Widget? child) {
        return ListTile(
          tileColor:
              apartPlayer.isPlaying && apartPlayer.getCurrentTrackIndex == index
                  ? Colors.red.shade50 : index.isOdd ? oddItemColor : evenItemColor,
          title: ContentArabicHtmlText(
            content: model.hadithArabic,
          ),
          subtitle: ContentHtmlText(
            content: model.hadithTranslation,
          ),
        );
      },
    );
  }
}
