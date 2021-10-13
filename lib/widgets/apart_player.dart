import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/provider/apart_player_state.dart';
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
          context.read<ApartPlayerState>().setCurrentIndex(widget.player.readingPlaylist!.currentIndex);
          context.read<ApartPlayerState>().toIndex(context.read<ApartPlayerState>().getCurrentIndex);
        });
        widget.player.playlistFinished.listen((playListFinished) {
          if (playListFinished) {
            context.read<ApartPlayerState>().toIndex(0);
            context.read<ApartPlayerState>().setCurrentIndexToDefault();
          }
        });
        return Consumer<ApartPlayerState>(
          builder: (context, apartPlayerState, _) => Row(
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
                  apartPlayerState.toIndex(widget.player.readingPlaylist!.currentIndex);
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
                  apartPlayerState.toIndex(widget.player.readingPlaylist!.currentIndex);
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
                  apartPlayerState.toIndex(widget.player.readingPlaylist!.currentIndex);
                },
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  CupertinoIcons.arrow_2_squarepath,
                  color: context.watch<ApartPlayerState>().getTrackLoopState
                      ? Colors.red
                      : Colors.white,
                  size: 25,
                ),
                onPressed: () {
                  context.read<ApartPlayerState>().loopState(
                      !context.read<ApartPlayerState>().getTrackLoopState);
                  widget.player.setLoopMode(
                      context.read<ApartPlayerState>().getTrackLoopState
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
