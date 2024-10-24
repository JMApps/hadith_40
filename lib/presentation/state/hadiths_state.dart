import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_constraints.dart';
import '../../domain/entities/hadith_entity.dart';
import '../../domain/usecases/hadiths_use_case.dart';

class HadithsState extends ChangeNotifier {
  final _mainAppSettingsBox = Hive.box(AppConstraints.keyBookmarkHadithsBox);

  final HadithsUseCase _hadithsUseCase;

  HadithsState(this._hadithsUseCase) {
    _favoriteHadiths = _mainAppSettingsBox.get(AppConstraints.keyBookmarkHadiths, defaultValue: <int>[]);
    _lastHadithId = _mainAppSettingsBox.get(AppConstraints.keyLastHadithId, defaultValue: 1);
  }

  Future<List<HadithEntity>> fetchAllHadiths({required String tableName}) async {
    return await _hadithsUseCase.fetchAllHadiths(tableName: tableName);
  }

  Future<HadithEntity> fetchHadithById({required String tableName, required int hadithId}) async {
    return await _hadithsUseCase.fetchHadithById(tableName: tableName, hadithId: hadithId);
  }

  Future<List<HadithEntity>> fetchFavoriteHadiths({required String tableName, required List<int> favorites}) async {
    return await _hadithsUseCase.fetchFavoriteHadiths(tableName: tableName, favorites: favorites);
  }

  late List<int> _favoriteHadiths = [];

  List<int> get getFavoriteHadiths => _favoriteHadiths;

  void toggleFavorite({required int hadithId}) async {
    final bool exist = _favoriteHadiths.contains(hadithId);
    if (exist) {
      _favoriteHadiths.remove(hadithId);
    } else {
      _favoriteHadiths.add(hadithId);
    }
    await _mainAppSettingsBox.put(AppConstraints.keyBookmarkHadiths, _favoriteHadiths);
    notifyListeners();
  }

  bool isFavorite({required int hadithId}) {
    return _favoriteHadiths.contains(hadithId);
  }

  late int _lastHadithId;

  int get getLastHadithId => _lastHadithId;

  void saveLastHadithId(int hadithId) async {
    _lastHadithId = hadithId;
    await _mainAppSettingsBox.put(AppConstraints.keyLastHadithId, hadithId);
    notifyListeners();
  }
}