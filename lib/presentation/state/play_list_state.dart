import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../core/strings/app_constraints.dart';

class PlayListState extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final ItemScrollController _itemScrollController = ItemScrollController();

  int _currentIndex = -1;
  bool _autoScrollEnabled = false;
  LoopMode _loopMode = LoopMode.off;

  AudioPlayer get player => _audioPlayer;
  ItemScrollController get itemScrollController => _itemScrollController;
  int get currentIndex => _currentIndex;
  LoopMode get loopMode => _loopMode;

  PlayListState() {
    _loadPlaylist();

    _audioPlayer.playerStateStream.listen((state) async {
      if (state.processingState == ProcessingState.completed) {
        final lastIndex = AppConstraints.trackNames.length - 1;
        if (_currentIndex == lastIndex && _loopMode != LoopMode.all) {
          await _audioPlayer.stop();
          await _audioPlayer.seek(Duration.zero, index: 0);
          _currentIndex = -1;
          _autoScrollEnabled = false;
          notifyListeners();
        }
      }
    });

    _audioPlayer.currentIndexStream.listen((index) {
      if (index != null) {
        _currentIndex = index;
        notifyListeners();

        if (_autoScrollEnabled) {
          _itemScrollController.scrollTo(
            index: _currentIndex,
            duration: const Duration(milliseconds: 250),
          );
        }
      }
    });
  }

  Future<void> _loadPlaylist() async {
    await _audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: AppConstraints.trackNames.map((name) {
          return AudioSource.asset('assets/audios/$name.mp3');
        }).toList(),
      ),
    );
  }

  void play() async {
    if (_currentIndex == -1) {
      _autoScrollEnabled = true;
      await _audioPlayer.seek(Duration.zero, index: 0);
    }
    _audioPlayer.play();
    notifyListeners();
  }

  void pause() {
    _audioPlayer.pause();
    notifyListeners();
  }

  void playAt(int index) async {
    await _audioPlayer.seek(Duration.zero, index: index);
    _audioPlayer.play();
  }

  void next() async {
    _autoScrollEnabled = true;
    await _audioPlayer.seekToNext();
  }

  void previous() async {
    _autoScrollEnabled = true;
    await _audioPlayer.seekToPrevious();
  }

  void toggleLoopPlaylist() {
    _loopMode = _loopMode == LoopMode.all ? LoopMode.off : LoopMode.all;
    _audioPlayer.setLoopMode(_loopMode);
    notifyListeners();
  }

  void toggleLoopTrack() {
    _loopMode = _loopMode == LoopMode.one ? LoopMode.off : LoopMode.one;
    _audioPlayer.setLoopMode(_loopMode);
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}


