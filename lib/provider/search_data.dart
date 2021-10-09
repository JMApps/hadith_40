import 'package:flutter/material.dart';

class SearchData with ChangeNotifier {
  String _textFieldText = '';

  String get getTextFieldText => _textFieldText;

  updateTextFieldData(String newString) {
    _textFieldText = newString;
    notifyListeners();
  }
}