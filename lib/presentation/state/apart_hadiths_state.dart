import 'package:flutter/material.dart';

import '../../domain/entities/apart_hadith_entity.dart';
import '../../domain/usecases/apart_hadiths_use_case.dart';

class ApartHadithsState extends ChangeNotifier {
  final ApartHadithsUseCase _apartHadithsUseCase;

  ApartHadithsState(this._apartHadithsUseCase);

  Future<List<ApartHadithEntity>> fetchApartHadithById({required String tableName, required int hadithId}) async {
    return await _apartHadithsUseCase.fetchApartHadithsById(tableName: tableName, hadithId: hadithId);
  }
}