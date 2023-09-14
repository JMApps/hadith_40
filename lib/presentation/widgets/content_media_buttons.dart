import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/presentation/uistate/content_player_state.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class ContentMediaButtons extends StatelessWidget {
  const ContentMediaButtons({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
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
                  return StreamBuilder<PlayerState>(
                    stream: player.playerStateStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final playerState = snapshot.data!;
                        if (!playerState.playing) {
                          return FilledButton.tonal(
                            onPressed: () {
                              player.play();
                            },
                            child: const Icon(
                              CupertinoIcons.play,
                            ),
                          );
                        } else if (playerState.playing) {
                          return FilledButton.tonal(
                            onPressed: () {
                              player.pause();
                            },
                            child: const Icon(
                              CupertinoIcons.pause,
                            ),
                          );
                        } else if (playerState.processingState == ProcessingState.completed) {
                          FilledButton.tonal(
                            onPressed: () {
                              player.play();
                            },
                            child: const Icon(
                              CupertinoIcons.play,
                            ),
                          );
                        }
                      }
                      return const Text('-:-');
                    },
                  );
                },
              ),
              Consumer<ContentPlayerState>(
                builder: (BuildContext context, player, Widget? child) {
                  return FilledButton.tonal(
                    onPressed: () {},
                    child: const Icon(
                      CupertinoIcons.arrow_2_circlepath,
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
        ],
      ),
    );
  }
}
