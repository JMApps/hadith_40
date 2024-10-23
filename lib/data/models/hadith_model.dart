import '../../core/strings/database_values.dart';

class HadithModel {
  final int id;
  final String hadithNumber;
  final String hadithTitle;
  final String hadithArabic;
  final String hadithTranslation;
  final String nameAudio;

  const HadithModel({
    required this.id,
    required this.hadithNumber,
    required this.hadithTitle,
    required this.hadithArabic,
    required this.hadithTranslation,
    required this.nameAudio,
  });

  factory HadithModel.fromMap(Map<String, Object?> map) {
    return HadithModel(
      id: map[DatabaseValues.dbId] as int,
      hadithNumber: map[DatabaseValues.dbHadithNumber] as String,
      hadithTitle: map[DatabaseValues.dbHadithTitle] as String,
      hadithArabic: map[DatabaseValues.dbHadithArabic] as String,
      hadithTranslation: map[DatabaseValues.dbHadithTranslation] as String,
      nameAudio: map[DatabaseValues.dbNameAudio] as String,
    );
  }
}
