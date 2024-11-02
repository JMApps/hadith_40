import 'package:flutter/material.dart';

class ContentIndexState extends ChangeNotifier {
  int _hadithId;

  ContentIndexState(this._hadithId);

  int get getHadithId => _hadithId;

  set setHadithId(int hadithId) {
    _hadithId = hadithId;
    notifyListeners();
  }
}