class ChapterHadith {
  final int id;
  final String hadithNumber;
  final String hadithTitle;

  ChapterHadith({
    required this.id,
    required this.hadithNumber,
    required this.hadithTitle,
  });

  factory ChapterHadith.fromMap(Map<String, dynamic> map) {
    return ChapterHadith(
      id: map['id'] as int,
      hadithNumber: map['hadeeth_number'] as String,
      hadithTitle: map['hadeeth_title'] as String,
    );
  }
}
