class ChapterHadithModel {
  final int id;
  final String hadithNumber;
  final String hadithTitle;

  const ChapterHadithModel({
    required this.id,
    required this.hadithNumber,
    required this.hadithTitle,
  });

  factory ChapterHadithModel.fromMap(Map<String, dynamic> map) {
    return ChapterHadithModel(
      id: map['id'] as int,
      hadithNumber: map['hadith_number'] as String,
      hadithTitle: map['hadith_title'] as String,
    );
  }
}
