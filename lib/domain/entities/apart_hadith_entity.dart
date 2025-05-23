import '../../data/models/apart_hadith_model.dart';

class ApartHadithEntity {
  final int id;
  final String hadithArabic;
  final String hadithTranslation;
  final String nameAudio;

  const ApartHadithEntity({
    required this.id,
    required this.hadithArabic,
    required this.hadithTranslation,
    required this.nameAudio,
  });

  factory ApartHadithEntity.fromModel(ApartHadithModel model) {
    return ApartHadithEntity(
      id: model.id,
      hadithArabic: model.hadithArabic,
      hadithTranslation: model.hadithTranslation,
      nameAudio: model.nameAudio,
    );
  }
}
