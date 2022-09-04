import 'package:aagel/src/core/config/themes/language_manager.dart';
import 'package:aagel/src/core/config/themes/theme_manager.dart';
import 'package:aagel/src/core/services/service_interface.dart';
import 'package:flutter/material.dart';

class SettingService implements ServiceInterface {
  @override
  String get name => "Setting";

  @override
  Future<void> initialize() async {
    ThemeManager().load();
    LanguageManager().load();
  }

  static ThemeMode get stateMod => ThemeManager().mode;
  static Locale get getLocale => LanguageManager().locale!;
}
