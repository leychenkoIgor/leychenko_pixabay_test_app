import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app_locatization.dart';



// Class for handling localization delegate
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  // Constructor
  const AppLocalizationsDelegate();


  // Method to check if a locale is supported
  @override
  bool isSupported(Locale locale) {
    // Currently only English and Spanish are supported
    bool result = ['uk', 'en'].contains(locale.languageCode);
    return result;
  }


  // Method to load the localized strings for a locale
  @override
  Future<AppLocalizations> load(Locale locale) {
    AppLocalizations localizations = AppLocalizations(locale);
    GetIt.instance.registerSingleton<AppLocalizations>(localizations);
    return localizations.load().then((bool _) {
      return localizations;
    });
  }


  // Method to decide if the delegate should be reloaded
  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

AppLocalizations get appLoc {
  return GetIt.I<AppLocalizations>();
}