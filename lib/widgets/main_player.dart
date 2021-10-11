import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/provider/main_player_state.dart';
import 'package:provider/provider.dart';

class MainPlayer extends StatelessWidget {
  MainPlayer({Key? key, required this.hadeethId}) : super(key: key);

  final int hadeethId;
  final _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    _assetsAudioPlayer.open(Audio('assets/audios/hadeeth_$hadeethId.mp3'),
        autoStart: false, loopMode: LoopMode.none);
    return _assetsAudioPlayer.builderRealtimePlayingInfos(
      builder: (context, realtimePlayingInfos) {
        _assetsAudioPlayer.playlistFinished.listen((finished) {
          if (finished) {}
        });
        return Row(
          children: [
            const SizedBox(width: 16),
            IconButton(
              icon: Icon(
                realtimePlayingInfos.isPlaying
                    ? CupertinoIcons.pause_circle
                    : CupertinoIcons.play_circle,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                _assetsAudioPlayer.playOrPause();
              },
            ),
            Expanded(
              child: Slider(
                min: 0,
                max: realtimePlayingInfos.duration.inMilliseconds.toDouble(),
                value: realtimePlayingInfos.currentPosition.inMilliseconds
                    .toDouble(),
                onChanged: (value) {
                  _assetsAudioPlayer.seek(Duration(milliseconds: value.toInt()));
                },
                thumbColor: Colors.white,
                activeColor: Colors.blue[300],
                inactiveColor: Colors.white,
              ),
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.arrow_2_squarepath,
                color: context.watch<MainPlayerState>().getTrackLoopState
                    ? Colors.red
                    : Colors.white,
                size: 30,
              ),
              onPressed: () {
                context.read<MainPlayerState>().loopState(!context.read<MainPlayerState>().getTrackLoopState);
                _assetsAudioPlayer.setLoopMode(context.read<MainPlayerState>().getTrackLoopState ? LoopMode.single : LoopMode.none);
              },
            ),
            const SizedBox(width: 16),
          ],
        );
      },
    );
  }
}
