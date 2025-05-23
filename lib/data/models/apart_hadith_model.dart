import '../../core/strings/database_values.dart';

class ApartHadithModel {
  final int id;
  final String hadithArabic;
  final String hadithTranslation;
  final String nameAudio;

  const ApartHadithModel({
    required this.id,
    required this.hadithArabic,
    required this.hadithTranslation,
    required this.nameAudio,
  });

  factory ApartHadithModel.fromMap(Map<String, Object?> map) {
    return ApartHadithModel(
      id: map[DatabaseValues.dbId] as int,
      hadithArabic: map[DatabaseValues.dbHadithArabic] as String,
      hadithTranslation: map[DatabaseValues.dbHadithTranslation] as String,
      nameAudio: map[DatabaseValues.dbNameAudio] as String,
    );
  }
}
