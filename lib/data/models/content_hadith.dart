class ContentHadith {
  final int id;
  final String hadithNumber;
  final String hadithTitle;
  final String hadithArabic;
  final String hadithTranslation;
  final String nameAudio;

  ContentHadith({
    required this.id,
    required this.hadithNumber,
    required this.hadithTitle,
    required this.hadithArabic,
    required this.hadithTranslation,
    required this.nameAudio,
  });

  factory ContentHadith.fromMap(Map<String, dynamic> map) {
    return ContentHadith(
      id: map['id'] as int,
      hadithNumber: map['hadeeth_number'] as String,
      hadithTitle: map['hadeeth_title'] as String,
      hadithArabic: map['hadeeth_arabic'] as String,
      hadithTranslation: map['hadeeth_translation'] as String,
      nameAudio: map['name_audio'] as String,
    );
  }
}
