class BookmarkHadith {
  final int id;
  final String hadithNumber;
  final String hadithTitle;

  BookmarkHadith({
    required this.id,
    required this.hadithNumber,
    required this.hadithTitle,
  });

  factory BookmarkHadith.fromMap(Map<String, dynamic> map) {
    return BookmarkHadith(
      id: map['id'] as int,
      hadithNumber: map['hadeeth_number'] as String,
      hadithTitle: map['hadeeth_title'] as String,
    );
  }
}
