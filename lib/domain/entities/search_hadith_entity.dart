class SearchHadithEntity {
  final int id;
  final String hadithNumber;
  final String hadithTitle;

  SearchHadithEntity({
    required this.id,
    required this.hadithNumber,
    required this.hadithTitle,
  });

  factory SearchHadithEntity.fromMap(Map<String, dynamic> map) {
    return SearchHadithEntity(
      id: map['id'] as int,
      hadithNumber: map['hadeeth_number'] as String,
      hadithTitle: map['hadeeth_title'] as String,
    );
  }
}
