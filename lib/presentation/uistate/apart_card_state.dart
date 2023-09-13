import 'package:flutter/material.dart';

class ApartCardState extends ChangeNotifier {
  bool _cardFlip = true;

  bool get getCardFlip => _cardFlip;

  setCardFlip() {
    _cardFlip = !_cardFlip;
    notifyListeners();
  }
}