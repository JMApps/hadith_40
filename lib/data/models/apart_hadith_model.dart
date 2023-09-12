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

  factory ApartHadithModel.fromMap(Map<String, dynamic> map) {
    return ApartHadithModel(
      id: map['id'] as int,
      hadithArabic: map['hadith_arabic'] as String,
      hadithTranslation: map['hadith_translation'] as String,
      nameAudio: map['name_audio'] as String,
    );
  }
}
