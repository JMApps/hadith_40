import 'package:flutter/cupertino.dart';

class HadeethSettingsState with ChangeNotifier {
  double _textSizeCount = 18;

  double get getTextSizeCount => _textSizeCount;

  changeTextSizeCount(double newSizeCount) {
    _textSizeCount = newSizeCount;
    notifyListeners();
  }
}