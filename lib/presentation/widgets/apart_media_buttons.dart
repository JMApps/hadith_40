import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/presentation/uistate/apart_player_state.dart';
import 'package:provider/provider.dart';

class ApartMediaButtons extends StatelessWidget {
  const ApartMediaButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      color: appColors.inversePrimary,
      child: Consumer<ApartPlayerState>(
        builder: (BuildContext context, player, Widget? child) {
          return Wrap(
            spacing: 16,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceEvenly,
            runAlignment: WrapAlignment.spaceEvenly,
            children: [
              FilledButton.tonal(
                onPressed: () {
                  player.previous();
                },
                child: const Icon(
                  CupertinoIcons.backward_end,
                ),
              ),
              FilledButton.tonal(
                onPressed: () {
                  player.togglePlay();
                },
                child: Icon(
                  player.isPlaying ? CupertinoIcons.stop : CupertinoIcons.play,
                ),
              ),
              FilledButton.tonal(
                onPressed: () {
                  player.onRepeat();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: appColors.inversePrimary,
                      duration: const Duration(milliseconds: 250),
                      content: Text(
                        player.isRepeat ? locale.repeatOn : locale.repeatOff,
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
                  color: player.isRepeat
                      ? appColors.primary
                      : appColors.inverseSurface,
                ),
              ),
              FilledButton.tonal(
                onPressed: () {
                  player.next();
                },
                child: const Icon(
                  CupertinoIcons.forward_end,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
