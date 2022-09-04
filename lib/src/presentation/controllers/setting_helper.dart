import 'package:aagel/src/core/config/themes/language_manager.dart';
import 'package:aagel/src/core/config/themes/light_theme.dart';
import 'package:aagel/src/core/config/themes/theme_manager.dart';
import 'package:aagel/src/core/utils/enums.dart';
import 'package:flutter/material.dart';

import '../../core/config/themes/dark_theme.dart';
import '../../core/services/storage_service.dart';
import '../../core/utils/constant.dart';

class SettingHelper {
  static changeLanguage(SupportLanguage? language) {
    if (language != null) {
      late Locale locale;
      switch (language) {
        case SupportLanguage.english:
          locale = const Locale('en', 'us');
          break;
        case SupportLanguage.arabic:
          locale = const Locale('ar', 'eg');
          break;
        default:
          locale = const Locale('en', 'us');
      }
      LanguageManager().changeLanguage(locale);
    }
  }

  static changeThemeMode(SupportTheme? theme) async {
    if (theme != null) {
      switch (theme) {
        case SupportTheme.dark:
          ThemeManager().changeThemeMode(DarkTheme());
          await _saveCurrentTheme(isDark: true);
          break;
        case SupportTheme.light:
          ThemeManager().changeThemeMode(LightTheme());
          await _saveCurrentTheme(isDark: false);
          break;
        default:
          ThemeManager().changeThemeMode(DarkTheme());
          await _saveCurrentTheme(isDark: true);
      }
    }
  }

  static Future<void> _saveCurrentTheme({required bool isDark}) async {
    await StorageService().saveBool(Constant.kThemeModeKey, isDark);
  }
}
