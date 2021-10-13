import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/provider/main_player_state.dart';
import 'package:provider/provider.dart';

class MainPlayer extends StatefulWidget {
  const MainPlayer({Key? key, required this.hadeethId}) : super(key: key);

  final int hadeethId;

  @override
  _MainPlayerState createState() => _MainPlayerState();
}

class _MainPlayerState extends State<MainPlayer> {
  final _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    _assetsAudioPlayer.open(
        Audio('assets/audios/hadeeth_${widget.hadeethId}.mp3'),
        autoStart: false,
        loopMode: LoopMode.none);
    super.initState();
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                size: 35,
              ),
              onPressed: () {
                _assetsAudioPlayer.playOrPause();
              },
            ),
            const SizedBox(width: 16),
            Text(
              _getTimeString(realtimePlayingInfos.currentPosition.inSeconds),
              style: const TextStyle(color: Colors.white),
            ),
            Expanded(
              child: Slider(
                min: 0,
                max: realtimePlayingInfos.duration.inMilliseconds.toDouble(),
                value: realtimePlayingInfos.currentPosition.inMilliseconds
                    .toDouble(),
                onChanged: (value) {
                  _assetsAudioPlayer
                      .seek(Duration(milliseconds: value.toInt()));
                },
                thumbColor: Colors.white,
                activeColor: Colors.blue[300],
                inactiveColor: Colors.white,
              ),
            ),
            Text(
              _getTimeString(realtimePlayingInfos.duration.inSeconds),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 16),
            IconButton(
              icon: Icon(
                CupertinoIcons.arrow_2_squarepath,
                color: context.watch<MainPlayerState>().getTrackLoopState
                    ? Colors.blue[200]
                    : Colors.white,
                size: 25,
              ),
              onPressed: () {
                context.read<MainPlayerState>().loopState(
                    !context.read<MainPlayerState>().getTrackLoopState);
                _assetsAudioPlayer.setLoopMode(
                    context.read<MainPlayerState>().getTrackLoopState
                        ? LoopMode.single
                        : LoopMode.none);
              },
            ),
            const SizedBox(width: 16),
          ],
        );
      },
    );
  }

  String _getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString';
  }
}
