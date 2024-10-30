import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_constraints.dart';

class CardModeState extends ChangeNotifier {
  final _contentSettings = Hive.box(AppConstraints.keyContentSettingsBox);

  CardModeState() {
    _reverseCard = _contentSettings.get(AppConstraints.keyCardModeState, defaultValue: true);
  }

  late bool _reverseCard;

  bool get getReverseCard => _reverseCard;

  void toggleReverseCard() {
    _reverseCard = !_reverseCard;
    _contentSettings.put(AppConstraints.keyCardModeState, _reverseCard);
    notifyListeners();
  }
}