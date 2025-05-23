import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/play_list_state.dart';

class PlayListPlayer extends StatelessWidget {
  const PlayListPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayListState>(
      builder: (context, player, _) {
        return Card(
          shape: AppStyles.shape,
          child: Padding(
            padding: AppStyles.paddingBottomMini,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StreamBuilder<Duration>(
                  stream: player.player.positionStream,
                  builder: (context, snapshot) {
                    return Slider(
                      value: snapshot.data?.inSeconds.toDouble() ?? 0.0,
                      min: 0.0,
                      max: player.player.duration?.inSeconds.toDouble() ?? 1.0,
                      onChanged: (value) {
                        player.player.seek(Duration(seconds: value.toInt()));
                      },
                    );
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.repeat),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: player.previous,
                        icon: Icon(Icons.skip_previous_rounded),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          player.player.playing
                              ? player.pause()
                              : player.play();
                        },
                        icon: Icon(
                          player.player.playing
                              ? Icons.pause_circle_outline
                              : Icons.play_circle_outline_rounded,
                        ),
                        iconSize: 35,
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: player.next,
                        icon: Icon(Icons.skip_next_rounded),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.refresh_rounded),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
