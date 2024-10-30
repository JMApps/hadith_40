import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HadithPlayerState extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get audioPlayer => _audioPlayer;

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  bool _isRepeating = false;
  bool get isRepeating => _isRepeating;

  int _currentTrackId = -1;

  HadithPlayerState() {
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _resetPlayerState();
      }
    });
  }

  Future<void> playTrack({required String audioName, required int trackId}) async {
    if (_currentTrackId != trackId) {
      await _audioPlayer.setAsset('assets/audios/$audioName.mp3');
      _audioPlayer.play();
    } else {
      if (_audioPlayer.playing) {
        _audioPlayer.pause();
      } else {
        _audioPlayer.play();
      }
    }

    _isPlaying = _audioPlayer.playing;
    notifyListeners();
  }

  void stopTrack() {
    if (!hasListeners) return;
    if (isPlaying) {
      _audioPlayer.stop();
      _resetPlayerState();
    }
  }

  void _resetPlayerState() {
    if (!hasListeners) return;
    _isPlaying = false;
    notifyListeners();
  }

  void toggleRepeatMode() {
    _isRepeating = !_isRepeating;
    _audioPlayer.setLoopMode(_isRepeating ? LoopMode.one : LoopMode.off);
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
