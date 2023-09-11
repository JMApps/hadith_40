class SearchHadith {
  final int id;
  final String hadithNumber;
  final String hadithTitle;

  SearchHadith({
    required this.id,
    required this.hadithNumber,
    required this.hadithTitle,
  });

  factory SearchHadith.fromMap(Map<String, dynamic> map) {
    return SearchHadith(
      id: map['id'] as int,
      hadithNumber: map['hadeeth_number'] as String,
      hadithTitle: map['hadeeth_title'] as String,
    );
  }
}
