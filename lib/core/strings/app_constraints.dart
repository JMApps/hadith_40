import 'dart:ui';

class AppConstraints {
  static const String fontGilroy = 'Gilroy';
  static const String fontSFPro = 'SF Pro';

  static const String keyMainAppSettingsBox = 'key_main_app_settings_box';
  static const String keyContentSettingsBox = 'key_content_settings_box';
  static const String keyBookmarkHadithsBox = 'key_bookmark_hadiths_box';

  static const String keyBookmarkHadiths = 'key_bookmark_hadiths';
  static const String keyLastHadithId = 'key_last_hadith_id';
  static const String keyCardModeState = 'key_card_mode_state';

  static const String keyArabicFontIndex = 'key_arabic_font_index';
  static const String keyArabicFontSizeIndex = 'key_arabic_size_index';
  static const String keyArabicFontAlignIndex = 'key_arabic_align_index';
  static const String keyArabicLightColor = 'key_arabic_light_color_index';
  static const String keyArabicDarkColor = 'key_arabic_dark_color_index';

  static const String keyTranslationFontIndex = 'key_translation_font_index';
  static const String keyTranslationFontSizeIndex = 'key_translation_size_index';
  static const String keyTranslationFontAlignIndex = 'key_translation_align_index';
  static const String keyTranslationLightColor = 'key_translation_light_color_index';
  static const String keyTranslationDarkColor = 'key_translation_dark_color_index';

  static const String keyLocaleIndex = 'key_locale_index';
  static const String keyNotificationState = 'key_notification_state';
  static const String keyNotificationTime = 'key_notification_time';
  static const String keyDisplayAlwaysOn = 'key_display_on_off';
  static const String keyAppThemeColor = 'key_app_theme_color';
  static const String keyThemeModeIndex = 'key_theme_mode_index';

  static const List<String> appLanguages = [
    'English',
    'Türkçe',
    'Русский',
    'Кыргызча',
  ];

  static const List<Locale> appLocales = [
    Locale('en', 'EN'),
    Locale('tr', 'TR'),
    Locale('ru', 'RU'),
    Locale('ky', 'KG'),
  ];
}