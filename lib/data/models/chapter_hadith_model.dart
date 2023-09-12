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
      hadithNumber: map['hadeeth_number'] as String,
      hadithTitle: map['hadeeth_title'] as String,
    );
  }
}
