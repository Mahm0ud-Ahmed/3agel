import 'package:aagel/src/core/services/storage_service.dart';
import 'package:aagel/src/core/utils/constant.dart';
import 'package:flutter/material.dart';

class LanguageManager extends ChangeNotifier {
  Locale? locale;

  load() {
    String languageApp =
        StorageService().getString(Constant.kLocaleLanguageCode) ?? 'en';
    String countryCode =
        StorageService().getString(Constant.kLocaleCountryCode) ?? 'us';
    locale = Locale(languageApp, countryCode);

    notifyListeners();
  }

  changeLanguage(Locale newLocale) async {
    await saveCurrentLang(newLocale);
    locale = newLocale;
    notifyListeners();
  }

  Future<void> saveCurrentLang(Locale newLocale) async {
    await StorageService()
        .saveString(Constant.kLocaleLanguageCode, newLocale.languageCode);
    await StorageService()
        .saveString(Constant.kLocaleCountryCode, newLocale.countryCode ?? 'us');
  }

  static LanguageManager? _instance;

  LanguageManager._init();

  factory LanguageManager() => _instance ??= LanguageManager._init();
}
