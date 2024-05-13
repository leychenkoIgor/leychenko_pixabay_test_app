import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// Class for handling app localizations
class AppLocalizations {
  final Locale locale;
  Map<String, String> _localizedStrings = {};
  AppLocalizations(this.locale);

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString('assets/locales/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? 'Key not found';
  }
}