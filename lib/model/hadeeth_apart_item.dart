class HadeethApartItem {
  int? id;
  String? hadeethArabic;
  String? hadeethTranslation;
  String? nameAudio;

  HadeethApartItem(
    this.id,
    this.hadeethArabic,
    this.hadeethTranslation,
    this.nameAudio,
  );

  HadeethApartItem.fromMap(dynamic obj) {
    id = obj['_id'];
    hadeethArabic = obj['hadeeth_arabic'];
    hadeethTranslation = obj['hadeeth_translation'];
    nameAudio = obj['name_audio'];
  }
}
