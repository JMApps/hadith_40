import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainPlayerState with ChangeNotifier {
  final _itemScrollController = ItemScrollController();

  int _currentTrackIndex = -1;

  int get getCurrentIndex => _currentTrackIndex;

  bool _trackLoopState = false;

  bool get getTrackLoopState => _trackLoopState;

  playOnly(AssetsAudioPlayer assetsAudioPlayer) {
    assetsAudioPlayer.playlistPlayAtIndex(_currentTrackIndex);
    notifyListeners();
  }

  setCurrentIndex(int index) {
    _currentTrackIndex = index;
    notifyListeners();
  }

  ItemScrollController get getItemScrollController => _itemScrollController;

  loopState(bool loopState) {
    _trackLoopState = loopState;
    notifyListeners();
  }

  toIndex(int index) {
    _itemScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInSine);
    _currentTrackIndex = index;
    notifyListeners();
  }

  setCurrentIndexToDefault() {
    _currentTrackIndex = -1;
    notifyListeners();
  }
}