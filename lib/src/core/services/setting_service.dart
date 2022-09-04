import 'package:aagel/src/core/config/themes/theme_manager.dart';
import 'package:aagel/src/core/services/service_interface.dart';
import 'package:flutter/material.dart';

class SettingService implements ServiceInterface {
  @override
  String get name => "Setting";
  late final ThemeManager _themeManager;

  @override
  Future<void> initialize() async {
    _themeManager = ThemeManager();
    _themeManager.load();
  }

  static ThemeMode get stateMod => ThemeManager().mode;
}
