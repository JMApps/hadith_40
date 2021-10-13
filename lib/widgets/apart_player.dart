import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/provider/main_player_state.dart';
import 'package:provider/provider.dart';

class ApartPlayer extends StatefulWidget {
  const ApartPlayer({Key? key, required this.snapshot, required this.player}) : super(key: key);

  final AsyncSnapshot snapshot;
  final AssetsAudioPlayer player;

  @override
  _ApartPlayerState createState() => _ApartPlayerState();
}

class _ApartPlayerState extends State<ApartPlayer> {

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  initPlayer() async {
    var listAudios = List<Audio>.generate(widget.snapshot.data.length,
        (i) => Audio('assets/audios/${widget.snapshot.data[i].nameAudio}.mp3'));
    widget.player.open(
        Playlist(
          audios: listAudios,
        ),
        autoStart: false,
        loopMode: LoopMode.none);
  }

  @override
  Widget build(BuildContext context) {
    return widget.player.builderRealtimePlayingInfos(
      builder: (context, realtimePlayingInfos) {
        widget.player.playlistAudioFinished.listen((event) {
          context.read<MainPlayerState>().setCurrentIndex(widget.player.readingPlaylist!.currentIndex);
          context.read<MainPlayerState>().toIndex(context.read<MainPlayerState>().getCurrentIndex);
        });
        widget.player.playlistFinished.listen((playListFinished) {
          if (playListFinished) {
            context.read<MainPlayerState>().toIndex(0);
            context.read<MainPlayerState>().setCurrentIndexToDefault();
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
                  widget.player.previous();
                  mainPlayerState.toIndex(widget.player.readingPlaylist!.currentIndex);
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
                  widget.player.playOrPause();
                  mainPlayerState.toIndex(widget.player.readingPlaylist!.currentIndex);
                },
              ),
              IconButton(
                icon: const Icon(
                  CupertinoIcons.forward_end_alt,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  widget.player.next(stopIfLast: true);
                  mainPlayerState.toIndex(widget.player.readingPlaylist!.currentIndex);
                },
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  CupertinoIcons.arrow_2_squarepath,
                  color: context.watch<MainPlayerState>().getTrackLoopState
                      ? Colors.red
                      : Colors.white,
                  size: 25,
                ),
                onPressed: () {
                  context.read<MainPlayerState>().loopState(
                      !context.read<MainPlayerState>().getTrackLoopState);
                  widget.player.setLoopMode(
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
