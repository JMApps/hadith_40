import 'package:flutter/material.dart';
import 'package:hadith_40/domain/entities/apart_hadith_entity.dart';
import 'package:hadith_40/presentation/uistate/apart_player_state.dart';
import 'package:hadith_40/presentation/widgets/content_arabic_html_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final Color currentTrackColor = appColors.primary.withOpacity(0.50);
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Consumer<ApartPlayerState>(
      builder: (BuildContext context, apartPlayer, Widget? child) {
        return StreamBuilder<int?>(
          stream: apartPlayer.currentIndexStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final currentIndex = snapshot.data ?? -1;
              if (currentIndex >= 0) {
                final isPlaying = currentIndex == index && apartPlayer.isPlaying;
                return ListTile(
                  onTap: () {
                    apartPlayer.selectOne(hadithIndex: index);
                  },
                  tileColor: isPlaying ? currentTrackColor : index.isOdd ? oddItemColor : evenItemColor,
                  title: ContentArabicHtmlText(
                    content: model.hadithArabic,
                  ),
                  subtitle: locale.localeName.contains('ru') ? ContentHtmlText(
                    content: model.hadithTranslation,
                  ) : const SizedBox(),
                );
              }
            }
            return const CircularProgressIndicator.adaptive();
          },
        );
      },
    );
  }
}
