import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HadeethSettingsState with ChangeNotifier {

  double _textSizeCount = 18;

  double get getTextSizeCount => _textSizeCount;

  changeTextSizeCount(double newSizeCount) async {
    _textSizeCount = newSizeCount;
    notifyListeners();
  }

  saveTextSizeCount(double lastSizeCount) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setDouble('key_text_size', lastSizeCount);
  }

  getLastTextSizeCount() async {
    final preferences = await SharedPreferences.getInstance();
    _textSizeCount = preferences.getDouble('key_text_size') ?? 18;
  }
}
