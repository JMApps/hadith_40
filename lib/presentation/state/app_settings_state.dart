import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../core/strings/app_constraints.dart';

class AppSettingsState extends ChangeNotifier {
  final _mainSettingsBox = Hive.box(AppConstraints.keyMainAppSettingsBox);
  Locale deviceLocale = PlatformDispatcher.instance.locale;

  AppSettingsState() {
    _localeIndex = _mainSettingsBox.get(AppConstraints.keyLocaleIndex, defaultValue: _getDefLocaleIndex());
    _notificationState = _mainSettingsBox.get(AppConstraints.keyNotificationState, defaultValue: false);
    _notificationTime = _mainSettingsBox.get(AppConstraints.keyNotificationTime, defaultValue: DateTime(2025, 12, 31, 10, 0).toIso8601String());
    _displayAlwaysOn = _mainSettingsBox.get(AppConstraints.keyDisplayAlwaysOn, defaultValue: true);
    _displayAlwaysOn ? WakelockPlus.enable() : WakelockPlus.disable();
    _appThemeColor = _mainSettingsBox.get(AppConstraints.keyAppThemeColor, defaultValue: Colors.blue.value);
    _themeModeIndex = _mainSettingsBox.get(AppConstraints.keyThemeModeIndex, defaultValue: 2);
  }

  int _getDefLocaleIndex() {
    final deviceLocale = PlatformDispatcher.instance.locale;
    switch (deviceLocale.languageCode) {
      case 'tr':
        return 1;
      case 'ru':
        return 2;
      case 'ky':
        return 3;
      default:
        return 0;
    }
  }

  late int _localeIndex;
  late bool _notificationState;
  late String _notificationTime;
  late bool _displayAlwaysOn;
  late int _appThemeColor;
  late int _themeModeIndex;

  int get getLocaleIndex => _localeIndex;

  bool get getNotificationState => _notificationState;

  DateTime get getNotificationTime => DateTime.parse(_notificationTime);

  bool get getDisplayAlwaysOn => _displayAlwaysOn;

  int get getAppThemeColor => _appThemeColor;

  int get getThemeModeIndex => _themeModeIndex;

  set setLocaleIndex(int localeIndex) {
    if (_localeIndex != localeIndex) {
      _localeIndex = localeIndex;
      _saveSetting(AppConstraints.keyLocaleIndex, localeIndex);
      notifyListeners();
    }
  }

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

  set setThemeModeIndex(int themeModeIndex) {
    if (_themeModeIndex != themeModeIndex) {
      _themeModeIndex = themeModeIndex;
      _saveSetting(AppConstraints.keyThemeModeIndex, themeModeIndex);
    }
  }

  set setAppThemeColor(int appThemeColor) {
    if (_appThemeColor != appThemeColor) {
      _appThemeColor = appThemeColor;
      _saveSetting(AppConstraints.keyAppThemeColor, appThemeColor);
    }
  }

  set setDisplayAlwaysOn(bool value) {
    _displayAlwaysOn = value;
    _displayAlwaysOn ? WakelockPlus.enable() : WakelockPlus.disable();
    _saveSetting(AppConstraints.keyDisplayAlwaysOn, value);
  }

  set setNotificationTime(DateTime notificationTime) {
    _notificationTime = notificationTime.toIso8601String();
    _saveSetting(AppConstraints.keyNotificationTime, notificationTime.toIso8601String());
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
