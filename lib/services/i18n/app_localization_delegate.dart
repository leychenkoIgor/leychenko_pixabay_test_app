import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:leychenko_pixabay_test_app/services/envelopments/environment_config.dart';
import 'app_locatization.dart';
import 'bloc/locatization_cubit.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {

  const AppLocalizationsDelegate();


  // Method to check if a locale is supported
  @override
  bool isSupported(Locale locale) {
    bool result = EnvironmentConfig.supportedLocales.contains(locale.languageCode);
    return result;
  }


  // Method to load the localized strings for a locale
  @override
  Future<AppLocalizations> load(Locale locale) {

    if(GetIt.instance.isRegistered<AppLocalizations>()){
      GetIt.instance.unregister<AppLocalizations>();
    }
    AppLocalizations localizations = AppLocalizations(locale);
    GetIt.instance.registerSingleton<AppLocalizations>(localizations);
    return localizations.load().then((bool _) {
      loclCubit.newLocaleLoaded();
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


LocatizationCubit get loclCubit {
  return GetIt.I<LocatizationCubit>();
}