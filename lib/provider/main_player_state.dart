import 'package:flutter/cupertino.dart';

class MainPlayerState with ChangeNotifier {

  bool _trackLoopState = false;

  bool get getTrackLoopState => _trackLoopState;

  playProgress(bool loopState) {
    _trackLoopState = loopState;
    notifyListeners();
  }
}