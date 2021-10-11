import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/provider/main_player_state.dart';
import 'package:provider/provider.dart';

class ApartPlayer extends StatelessWidget {
  ApartPlayer({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;
  final _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    initPlayer();
    return _assetsAudioPlayer.builderRealtimePlayingInfos(
      builder: (context, realtimePlayingInfos) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const SizedBox(width: 60),
            IconButton(
              icon: const Icon(
                CupertinoIcons.backward_end_alt,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                if (_assetsAudioPlayer.readingPlaylist!.currentIndex > 0) {
                  _assetsAudioPlayer.previous();
                }
              },
            ),
            IconButton(
              icon: Icon(
                realtimePlayingInfos.isPlaying
                    ? CupertinoIcons.stop_circle
                    : CupertinoIcons.play_circle,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {
                realtimePlayingInfos.isPlaying
                    ? _assetsAudioPlayer.pause()
                    : _assetsAudioPlayer.playlistPlayAtIndex(
                        _assetsAudioPlayer.readingPlaylist!.currentIndex);
              },
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.forward_end_alt,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                if (_assetsAudioPlayer.readingPlaylist!.currentIndex <
                    snapshot.data.length - 1) {
                  _assetsAudioPlayer.playlistPlayAtIndex(
                      _assetsAudioPlayer.readingPlaylist!.currentIndex + 1);
                }
              },
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                CupertinoIcons.arrow_2_squarepath,
                color: context.watch<MainPlayerState>().getTrackLoopState ? Colors.red : Colors.white,
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

  initPlayer() async {
    var listAudios = List<Audio>.generate(snapshot.data.length,
        (i) => Audio('assets/audios/${snapshot.data[i].nameAudio}.mp3'));
    _assetsAudioPlayer.open(
        Playlist(
          audios: listAudios,
        ),
        autoStart: false,
        loopMode: LoopMode.none);
  }
}
