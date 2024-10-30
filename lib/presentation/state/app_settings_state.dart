import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../core/strings/app_constraints.dart';

class AppSettingsState extends ChangeNotifier {
  final _mainSettingsBox = Hive.box(AppConstraints.keyMainAppSettingsBox);

  AppSettingsState() {
    _notificationState = _getSetting(AppConstraints.keyNotificationState, false);
    _notificationTime = _getSetting(AppConstraints.keyNotificationTime, DateTime(2024, 12, 31, 4, 0));
    _displayAlwaysOn = _getSetting(AppConstraints.keyDisplayAlwaysOn, true);
    _displayAlwaysOn ? WakelockPlus.enable() : WakelockPlus.disable();
    _appThemeColor = _getSetting(AppConstraints.keyAppThemeColor, Colors.blue.value);
    _themeModeIndex = _getSetting(AppConstraints.keyThemeModeIndex, 2);
  }

  late bool _notificationState;
  late DateTime _notificationTime;
  late bool _displayAlwaysOn;
  late int _appThemeColor;
  late int _themeModeIndex;

  bool get getNotificationState => _notificationState;

  DateTime get getNotificationTime => _notificationTime;

  bool get getDisplayAlwaysOn => _displayAlwaysOn;

  int get getAppThemeColor => _appThemeColor;

  ThemeMode get getThemeMode {
    return ThemeMode.values[_themeModeIndex.clamp(0, ThemeMode.values.length - 1)];
  }

  int get getThemeModeIndex => _themeModeIndex;

  set setNotificationState(bool value) => _updateSetting(AppConstraints.keyNotificationState, value, () {
    _notificationState = value;
  });

  set setNotificationTime(DateTime time) => _updateSetting(AppConstraints.keyNotificationTime, time.toIso8601String(), () {
    _notificationTime = time;
  });

  set setDisplayAlwaysOn(bool value) => _updateSetting(AppConstraints.keyDisplayAlwaysOn, value, () {
    _displayAlwaysOn = value;
    value ? WakelockPlus.enable() : WakelockPlus.disable();
  });

  set setAppThemeColor(int color) => _updateSetting(AppConstraints.keyAppThemeColor, color, () {
    _appThemeColor = color;
  });

  set setThemeModeIndex(int themeIndex) => _updateSetting(AppConstraints.keyThemeModeIndex, themeIndex, () {
    _themeModeIndex = themeIndex;
  });

  T _getSetting<T>(String key, T defaultValue) {
    return _mainSettingsBox.get(key, defaultValue: defaultValue) as T;
  }

  void _updateSetting<T>(String key, T value, VoidCallback updateLocalValue) async {
    updateLocalValue();
    notifyListeners();
    await _mainSettingsBox.put(key, value);
  }
}
