import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../core/strings/app_constraints.dart';

class AppSettingsState extends ChangeNotifier {
  final _mainSettingsBox = Hive.box(AppConstraints.keyMainAppSettingsBox);

  AppSettingsState() {
    _notificationState = _mainSettingsBox.get(AppConstraints.keyNotificationState, defaultValue: false);
    _notificationTime = _mainSettingsBox.get(AppConstraints.keyNotificationTime, defaultValue: DateTime(2024, 12, 31, 10, 0).toIso8601String());
    _displayAlwaysOn = _mainSettingsBox.get(AppConstraints.keyDisplayAlwaysOn, defaultValue: true);
    _displayAlwaysOn ? WakelockPlus.enable() : WakelockPlus.disable();
    _appThemeColor = _mainSettingsBox.get(AppConstraints.keyAppThemeColor, defaultValue: Colors.blue.value);
    _themeModeIndex = _mainSettingsBox.get(AppConstraints.keyThemeModeIndex, defaultValue: 2);
  }

  late bool _notificationState;
  late String _notificationTime;
  late bool _displayAlwaysOn;
  late int _appThemeColor;
  late int _themeModeIndex;

  bool get getNotificationState => _notificationState;

  DateTime get getNotificationTime => DateTime.parse(_notificationTime);

  bool get getDisplayAlwaysOn => _displayAlwaysOn;

  int get getAppThemeColor => _appThemeColor;

  int get getThemeModeIndex => _themeModeIndex;

  ThemeMode get getThemeMode {
    late ThemeMode currentTheme;
    switch(_themeModeIndex) {
      case 0:
        currentTheme = ThemeMode.light;
        break;
      case 1:
        currentTheme = ThemeMode.dark;
        break;
      case 2:
        currentTheme = ThemeMode.system;
        break;
      default: currentTheme = ThemeMode.system;
    }
    return currentTheme;
  }

  set setThemeModeIndex(int value) {
    _themeModeIndex = value;
    _saveSetting(AppConstraints.keyThemeModeIndex, value);
  }

  set setAppThemeColor(int value) {
    _appThemeColor = value;
    _saveSetting(AppConstraints.keyAppThemeColor, value);
  }

  set setDisplayAlwaysOn(bool value) {
    _displayAlwaysOn = value;
    _displayAlwaysOn ? WakelockPlus.enable() : WakelockPlus.disable();
    _saveSetting(AppConstraints.keyDisplayAlwaysOn, value);
  }

  set setNotificationTime(DateTime time) {
    _notificationTime = time.toIso8601String();
    _saveSetting(AppConstraints.keyNotificationTime, time.toIso8601String());
  }

  set setNotificationState(bool value) {
    _notificationState = value;
    _saveSetting(AppConstraints.keyNotificationState, value);
  }

  void _saveSetting(String key, dynamic value) async {
    await _mainSettingsBox.put(key, value);
    notifyListeners();
  }
}
