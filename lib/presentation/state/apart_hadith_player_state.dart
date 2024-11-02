import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ApartHadithPlayerState extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  late final Future<List<String>> _futureTrackList;
  late ConcatenatingAudioSource _playlist;
  final ItemScrollController _itemScrollController = ItemScrollController();

  bool _isPlaying = false;
  bool _isRepeating = false;
  int _currentTrackIndex = -1;

  int get currentTrackIndex => _currentTrackIndex;

  bool get isPlaying => _isPlaying;

  bool get isRepeating => _isRepeating;

  ItemScrollController get getItemScrollController => _itemScrollController;

  ApartHadithPlayerState({required Future<List<String>> futureTrackList}) {
    _futureTrackList = futureTrackList;
    _initializePlaylist();

    _audioPlayer.currentIndexStream.listen((index) {
      if (index != null && _isPlaying) {
        _currentTrackIndex = index;
          _itemScrollController.scrollTo(index: _currentTrackIndex, duration: Duration(milliseconds: 500));
        if (_itemScrollController.isAttached) {
        }
        notifyListeners();
      }
    });

    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _currentTrackIndex = -1;
        stopTrack();
        if (_itemScrollController.isAttached) {
          _itemScrollController.jumpTo(index: 0);
        }
        notifyListeners();
      }
    });
  }

  Future<void> _initializePlaylist() async {
    final List<String> trackList = await _futureTrackList;
    _playlist = ConcatenatingAudioSource(
      children: trackList.map((audioName) => AudioSource.asset('assets/audios/$audioName.mp3')).toList(),
    );
    await _audioPlayer.setAudioSource(_playlist);
  }

  void playTrack() {
    if (_currentTrackIndex == -1) {
      _currentTrackIndex = 0;
      _audioPlayer.seek(Duration.zero, index: _currentTrackIndex);
      _audioPlayer.play();
    }
    if (_currentTrackIndex != -1 && !_isPlaying) {
      _audioPlayer.play();
      _isPlaying = true;
    } else {
      _audioPlayer.pause();
      _isPlaying = false;
    }
    notifyListeners();
  }

  void playTrackIndex(int index) {
    _audioPlayer.seek(Duration.zero, index: index);
    _audioPlayer.play();
    _isPlaying = true;
    _currentTrackIndex = index;
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
    _currentTrackIndex = -1;
    _isPlaying = false;
    notifyListeners();
  }

  void nextTrack() {
    _audioPlayer.seekToNext();
  }

  void previousTrack() {
    _audioPlayer.seekToPrevious();
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
