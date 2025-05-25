import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ky.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ky'),
    Locale('ru'),
    Locale('tr')
  ];

  /// No description provided for @tableName.
  ///
  /// In en, this message translates to:
  /// **'Table_of_hadith_en'**
  String get tableName;

  /// No description provided for @apartTableName.
  ///
  /// In en, this message translates to:
  /// **'Table_of_hadith_cut_ru'**
  String get apartTableName;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'40 Hadiths'**
  String get appName;

  /// No description provided for @notificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get notificationTitle;

  /// No description provided for @notificationBody.
  ///
  /// In en, this message translates to:
  /// **'Time to learn a hadith'**
  String get notificationBody;

  /// No description provided for @hadith.
  ///
  /// In en, this message translates to:
  /// **'Hadith'**
  String get hadith;

  /// No description provided for @hadiths.
  ///
  /// In en, this message translates to:
  /// **'Hadiths'**
  String get hadiths;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @apart.
  ///
  /// In en, this message translates to:
  /// **'Separately'**
  String get apart;

  /// No description provided for @apartMode.
  ///
  /// In en, this message translates to:
  /// **'Separate mode'**
  String get apartMode;

  /// No description provided for @cards.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get cards;

  /// No description provided for @cardsMode.
  ///
  /// In en, this message translates to:
  /// **'Card mode'**
  String get cardsMode;

  /// No description provided for @reverseCard.
  ///
  /// In en, this message translates to:
  /// **'Flip cards'**
  String get reverseCard;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @player.
  ///
  /// In en, this message translates to:
  /// **'Player'**
  String get player;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @added.
  ///
  /// In en, this message translates to:
  /// **'Added'**
  String get added;

  /// No description provided for @themes.
  ///
  /// In en, this message translates to:
  /// **'Light, Dark, System'**
  String get themes;

  /// No description provided for @sizes.
  ///
  /// In en, this message translates to:
  /// **'Small, Normal, Medium, Large, Very large'**
  String get sizes;

  /// No description provided for @removed.
  ///
  /// In en, this message translates to:
  /// **'Removed'**
  String get removed;

  /// No description provided for @repeat.
  ///
  /// In en, this message translates to:
  /// **'Repeat'**
  String get repeat;

  /// No description provided for @repeatOn.
  ///
  /// In en, this message translates to:
  /// **'Repeat is on'**
  String get repeatOn;

  /// No description provided for @repeatOff.
  ///
  /// In en, this message translates to:
  /// **'Repeat is off'**
  String get repeatOff;

  /// No description provided for @repeatPlaylistOn.
  ///
  /// In en, this message translates to:
  /// **'Playlist repeat is on'**
  String get repeatPlaylistOn;

  /// No description provided for @repeatPlaylistOff.
  ///
  /// In en, this message translates to:
  /// **'Playlist repeat is off'**
  String get repeatPlaylistOff;

  /// No description provided for @continueRead.
  ///
  /// In en, this message translates to:
  /// **'Continue reading'**
  String get continueRead;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @startSearch.
  ///
  /// In en, this message translates to:
  /// **'Start search'**
  String get startSearch;

  /// No description provided for @favoriteIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Favorites list is empty'**
  String get favoriteIsEmpty;

  /// No description provided for @searchIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No results found for your query'**
  String get searchIsEmpty;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @translation.
  ///
  /// In en, this message translates to:
  /// **'Translation'**
  String get translation;

  /// No description provided for @font.
  ///
  /// In en, this message translates to:
  /// **'Font'**
  String get font;

  /// No description provided for @textSize.
  ///
  /// In en, this message translates to:
  /// **'Text size'**
  String get textSize;

  /// No description provided for @textsAlign.
  ///
  /// In en, this message translates to:
  /// **'Text alignment'**
  String get textsAlign;

  /// No description provided for @textColor.
  ///
  /// In en, this message translates to:
  /// **'Text color'**
  String get textColor;

  /// No description provided for @forLightTheme.
  ///
  /// In en, this message translates to:
  /// **'For light theme'**
  String get forLightTheme;

  /// No description provided for @forDarkTheme.
  ///
  /// In en, this message translates to:
  /// **'For dark theme'**
  String get forDarkTheme;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @defaultSettings.
  ///
  /// In en, this message translates to:
  /// **'Default settings'**
  String get defaultSettings;

  /// No description provided for @dailyNotifications.
  ///
  /// In en, this message translates to:
  /// **'Daily notifications'**
  String get dailyNotifications;

  /// No description provided for @interfaceLang.
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get interfaceLang;

  /// No description provided for @changeLang.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get changeLang;

  /// No description provided for @display.
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get display;

  /// No description provided for @displayAlwaysOn.
  ///
  /// In en, this message translates to:
  /// **'Display always on'**
  String get displayAlwaysOn;

  /// No description provided for @themeColor.
  ///
  /// In en, this message translates to:
  /// **'Theme color'**
  String get themeColor;

  /// No description provided for @selectThemeColor.
  ///
  /// In en, this message translates to:
  /// **'Select theme color'**
  String get selectThemeColor;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @themeApp.
  ///
  /// In en, this message translates to:
  /// **'App Theme'**
  String get themeApp;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @useOtherOurApps.
  ///
  /// In en, this message translates to:
  /// **'Try our other apps too:'**
  String get useOtherOurApps;

  /// No description provided for @shelfMuslim.
  ///
  /// In en, this message translates to:
  /// **'Muslim\'s Shelf'**
  String get shelfMuslim;

  /// No description provided for @fortressMuslim.
  ///
  /// In en, this message translates to:
  /// **'Fortress of the Muslim'**
  String get fortressMuslim;

  /// No description provided for @versionAndroid.
  ///
  /// In en, this message translates to:
  /// **'Android version:'**
  String get versionAndroid;

  /// No description provided for @versionIOS.
  ///
  /// In en, this message translates to:
  /// **'iOS version:'**
  String get versionIOS;

  /// No description provided for @ourApps.
  ///
  /// In en, this message translates to:
  /// **'Our apps'**
  String get ourApps;

  /// No description provided for @moreOurApps.
  ///
  /// In en, this message translates to:
  /// **'More of our apps'**
  String get moreOurApps;

  /// No description provided for @ourSocials.
  ///
  /// In en, this message translates to:
  /// **'Follow us on social media'**
  String get ourSocials;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ky', 'ru', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ky':
      return AppLocalizationsKy();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
