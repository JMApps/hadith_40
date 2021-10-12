import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/provider/main_player_state.dart';
import 'package:provider/provider.dart';

class ApartPlayer extends StatefulWidget {
  const ApartPlayer({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  _ApartPlayerState createState() => _ApartPlayerState();
}

class _ApartPlayerState extends State<ApartPlayer> {
  final _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  initPlayer() async {
    var listAudios = List<Audio>.generate(widget.snapshot.data.length,
        (i) => Audio('assets/audios/${widget.snapshot.data[i].nameAudio}.mp3'));
    _assetsAudioPlayer.open(
        Playlist(
          audios: listAudios,
        ),
        autoStart: false,
        loopMode: LoopMode.none);
  }

  @override
  Widget build(BuildContext context) {
    return _assetsAudioPlayer.builderRealtimePlayingInfos(
      builder: (context, realtimePlayingInfos) {
        _assetsAudioPlayer.playlistAudioFinished.listen((event) {
          context.read<MainPlayerState>().toIndex(_assetsAudioPlayer.readingPlaylist!.currentIndex);
        });
        _assetsAudioPlayer.playlistFinished.listen((playListFinished) {
          if (playListFinished) {
            context.read<MainPlayerState>().toIndex(0);
            context.read<MainPlayerState>().setCurrentIndex();
          }
        });
        return Consumer<MainPlayerState>(
          builder: (context, mainPlayerState, _) => Row(
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
                  _assetsAudioPlayer.previous();
                  mainPlayerState.toIndex(_assetsAudioPlayer.readingPlaylist!.currentIndex);
                },
              ),
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
              IconButton(
                icon: const Icon(
                  CupertinoIcons.forward_end_alt,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  _assetsAudioPlayer.next(stopIfLast: true);
                  mainPlayerState.toIndex(_assetsAudioPlayer.readingPlaylist!.currentIndex);
                },
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  CupertinoIcons.arrow_2_squarepath,
                  color: context.watch<MainPlayerState>().getTrackLoopState
                      ? Colors.red
                      : Colors.white,
                  size: 30,
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
          ),
        );
      },
    );
  }
}
