import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ContentPlayerState extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  ConcatenatingAudioSource? _audioSource;

  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  bool _isRepeat = false;

  bool get getIsRepeat => _isRepeat;

  int _currentTrackIndex = -1;

  int get getCurrentTrackIndex => _currentTrackIndex;

  Future<void> initializeAudioPlayer({required int hadithId}) async {
    final List<AudioSource> audioSources = List.generate(
      42,
      (index) => AudioSource.asset('assets/audios/hadeeth_${index + 1}.mp3'),
    );

    _audioSource = ConcatenatingAudioSource(
      children: [
        audioSources[hadithId],
      ],
    );

    await _audioPlayer.setAudioSource(_audioSource!);
    _audioPlayer.processingStateStream.listen(
      (event) {
        if (event == ProcessingState.completed) {
          _isPlaying = false;
          _audioPlayer.stop();
          notifyListeners();
        }
      },
    );
  }

  Future<void> togglePlay({required int hadithId}) async {
    _currentTrackIndex = hadithId;
    if (_audioPlayer.processingState == ProcessingState.ready) {
      if (!_isPlaying) {
        _isPlaying = true;
        notifyListeners();
        await _audioPlayer.play();
      } else {
        _isPlaying = false;
        notifyListeners();
        await _audioPlayer.pause();
      }
    } else {
      initializeAudioPlayer(hadithId: hadithId);
      if (!_isPlaying) {
        _isPlaying = true;
        notifyListeners();
        await _audioPlayer.play();
      } else {
        _isPlaying = false;
        notifyListeners();
        await _audioPlayer.pause();
      }
    }
  }

  Future<void> onRepeat() async {
    _isRepeat = !_isRepeat;
    notifyListeners();
    if (_audioPlayer.processingState == ProcessingState.ready) {
      if (_isRepeat) {
        _audioPlayer.setLoopMode(LoopMode.one);
      } else {
        _audioPlayer.setLoopMode(LoopMode.off);
      }
    }
  }

  Future<void> stop() async {
    _isPlaying = false;
    _isRepeat = false;
    _audioPlayer.stop();
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
