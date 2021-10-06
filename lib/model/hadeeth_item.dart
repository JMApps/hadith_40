class HadeethItem {
  int? id;
  String? hadeethNumber;
  String? hadeethTitle;
  String? hadeethArabic;
  String? hadeethTranslation;
  String? nameAudio;
  int? favoriteState;

  HadeethItem(
    this.id,
    this.hadeethNumber,
    this.hadeethTitle,
    this.hadeethArabic,
    this.hadeethTranslation,
    this.nameAudio,
    this.favoriteState,
  );

  HadeethItem.fromMap(dynamic obj) {
    id = obj['_id'];
    hadeethNumber = obj['hadeeth_number'];
    hadeethTitle = obj['hadeeth_title'];
    hadeethArabic = obj['hadeeth_arabic'];
    hadeethTranslation = obj['hadeeth_translation'];
    nameAudio = obj['name_audio'];
    favoriteState = obj['favorite_state'];
  }
}