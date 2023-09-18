import 'package:flutter/material.dart';
import 'package:hadith_40/domain/entities/apart_hadith_entity.dart';
import 'package:just_audio/just_audio.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ApartPlayerState extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  ConcatenatingAudioSource? _audioSource;

  AudioPlayer get audioPlayer => _audioPlayer;

  final ItemScrollController _itemScrollController = ItemScrollController();

  ItemScrollController get itemScrollController => _itemScrollController;

  Stream<int?> get currentIndexStream => _audioPlayer.currentIndexStream;

  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  bool _isRepeat = false;

  bool get isRepeat => _isRepeat;

  Future<void> initializeAudioPlayer(
      {required AsyncSnapshot<List<ApartHadithEntity>> snapshot}) async {
    List<AudioSource> audioSources = List.generate(
      snapshot.data!.length,
      (index) => AudioSource.asset('assets/audios/${snapshot.data![index].nameAudio}.mp3'),
    );

    _audioSource = ConcatenatingAudioSource(
      children: audioSources,
    );

    await _audioPlayer.setAudioSource(_audioSource!, initialIndex: 0, initialPosition: Duration.zero);

    _audioPlayer.currentIndexStream.listen((trackIndex) {
        if (trackIndex != null) {
          _itemScrollController.scrollTo(
            index: trackIndex,
            duration: const Duration(milliseconds: 50),
          );
        }
      },
    );

    _audioPlayer.processingStateStream.listen((event) {
        if (event == ProcessingState.completed) {
          _audioPlayer.stop();
          _isPlaying = false;
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

  Future<void> selectOne({required int hadithIndex}) async {
    await _audioPlayer.seek(Duration.zero, index: hadithIndex);
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    _isPlaying = false;
    notifyListeners();
  }

  Future<void> onRepeat() async {
    _isRepeat = !_isRepeat;
    notifyListeners();
    if (_isRepeat) {
      await _audioPlayer.setLoopMode(LoopMode.all);
    } else {
      await _audioPlayer.setLoopMode(LoopMode.off);
    }
  }

  Future<void> next() async {
    await _audioPlayer.seekToNext();
  }

  Future<void> previous() async {
    await _audioPlayer.seekToPrevious();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
