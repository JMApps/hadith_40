import 'package:flutter/material.dart';
import 'package:hadith_40/domain/entities/apart_hadith_entity.dart';
import 'package:just_audio/just_audio.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ApartPlayerState extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  ConcatenatingAudioSource? _audioSource;

  final ItemScrollController _itemScrollController = ItemScrollController();

  ItemScrollController get itemScrollController => _itemScrollController;

  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  int _currentTrackIndex = 0;

  int get getCurrentTrackIndex => _currentTrackIndex;

  set setCurrentTrackIndex(int index) {
    _currentTrackIndex = index;
    notifyListeners();
  }

  List<AudioSource> _audioNames = [];

  Future<void> initializeAudioPlayer(
      {required AsyncSnapshot<List<ApartHadithEntity>> snapshot}) async {
    _audioNames = List.generate(
      snapshot.data!.length,
      (index) => AudioSource.asset(
          'assets/audios/${snapshot.data![index].nameAudio}.mp3'),
    );

    _audioSource = ConcatenatingAudioSource(
      children: _audioNames,
    );

    await _audioPlayer.setAudioSource(_audioSource!);

    _audioPlayer.currentIndexStream.listen((trackIndex) {
        if (trackIndex != null) {
          _currentTrackIndex = trackIndex;
          _itemScrollController.scrollTo(
            index: trackIndex,
            duration: const Duration(milliseconds: 50),
          );
        }
      },
    );

    _audioPlayer.processingStateStream.listen(
      (event) {
        if (event == ProcessingState.completed) {
          _audioPlayer.stop();
          _isPlaying = false;
          _currentTrackIndex = 0;
          notifyListeners();
          _itemScrollController.scrollTo(
            index: 0,
            duration: const Duration(milliseconds: 500),
          );
        }
      },
    );
  }

  Future<void> togglePlay() async {
    _isPlaying = !_audioPlayer.playing;
    notifyListeners();
    if (_isPlaying) {
      await _audioPlayer.play();
    } else {
      await _audioPlayer.pause();
    }
  }

  Future<void> stop() async {
    _isPlaying = false;
    _currentTrackIndex = 0;
    _audioPlayer.stop();
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
