import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/presentation/uistate/content_player_state.dart';
import 'package:provider/provider.dart';

class ContentMediaButtons extends StatelessWidget {
  const ContentMediaButtons({
    super.key,
    required this.pageController,
    required this.hadithId,
  });

  final PageController pageController;
  final int hadithId;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Wrap(
        spacing: 16,
        children: [
          FilledButton.tonal(
            onPressed: () {
              if (pageController.hasClients) {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 750),
                  curve: Curves.easeOutSine,
                );
              }
            },
            child: const Icon(
              CupertinoIcons.chevron_back,
            ),
          ),
          Consumer<ContentPlayerState>(
            builder: (BuildContext context, player, Widget? child) {
              return FilledButton.tonal(
                onPressed: () {
                  player.togglePlay(hadithId: hadithId);
                },
                child: Icon(
                  player.isPlaying && player.getCurrentTrackIndex == hadithId
                      ? CupertinoIcons.pause
                      : CupertinoIcons.play,
                ),
              );
            },
          ),
          Consumer<ContentPlayerState>(
            builder: (BuildContext context, player, Widget? child) {
              return FilledButton.tonal(
                onPressed: () {
                  player.onRepeat();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: appColors.inversePrimary,
                      duration: const Duration(milliseconds: 250),
                      content: Text(
                        player.getIsRepeat ? locale.repeatOn : locale.repeatOff,
                        style: TextStyle(
                          fontSize: 18,
                          color: appColors.primary,
                        ),
                      ),
                    ),
                  );
                },
                child: Icon(
                  CupertinoIcons.arrow_2_circlepath,
                  color: player.getIsRepeat
                      ? appColors.primary
                      : appColors.inverseSurface,
                ),
              );
            },
          ),
          FilledButton.tonal(
            onPressed: () {
              if (pageController.hasClients) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 750),
                  curve: Curves.easeOutSine,
                );
              }
            },
            child: const Icon(
              CupertinoIcons.chevron_forward,
            ),
          ),
        ],
      ),
    );
  }
}
