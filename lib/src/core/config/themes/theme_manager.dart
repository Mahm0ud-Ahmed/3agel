import 'package:aagel/src/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/storage_service.dart';
import '../injector.dart';
import 'dark_theme.dart';
import 'i_theme.dart';
import 'light_theme.dart';


class ThemeManager extends ChangeNotifier{

  late ITheme _theme;
  late ThemeData _themeData;
  late ThemeMode _mode;
  bool _isDark = false;
  final StorageService _storage = injector();

  load() {
    _isDark = _storage.getBool(Constant.kThemeModeKey) ?? false;

    initialCurrentThemeApp();
    _theme.appColor;
    _theme.appStyle;
    setThemeData();
    setSystemStatusDefaultColor();

    notifyListeners();
  }

  initialCurrentThemeApp(){
    if(_isDark){
      _theme = DarkTheme();
      _mode = ThemeMode.dark;
    }else{
      _theme = LightTheme();
      _mode = ThemeMode.light;
    }
  }

  changeThemeMode(ITheme theme){
    _theme = theme;
    initialCurrentThemeByTheme();
    _theme.appColor;
    _theme.appStyle;
    setThemeData();
    setSystemStatusDefaultColor();
    notifyListeners();
  }

  initialCurrentThemeByTheme(){
    switch (_theme.runtimeType) {
      case DarkTheme:
        _theme = DarkTheme();
        _mode = ThemeMode.dark;
        break;
      default:
        _theme = LightTheme();
        _mode = ThemeMode.light;
    }
  }

  ThemeMode get mode => _mode;

  bool get isLight => mode == ThemeMode.light ? true : false;

  void setThemeData() {
    _themeData = ThemeData(
      scaffoldBackgroundColor: _theme.color[0],
      primarySwatch: _theme.primarySwatch,
      appBarTheme: AppBarTheme(color: _theme.primarySwatch),
      brightness: isLight ? Brightness.light : Brightness.dark,
    );
  }

  void setSystemStatusDefaultColor() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: _theme.appColor[0],
        statusBarIconBrightness: isLight ? Brightness.light : Brightness.dark,
        statusBarBrightness: isLight ? Brightness.dark : Brightness.light,

        systemNavigationBarColor: _theme.primarySwatch,
        systemNavigationBarDividerColor: isLight ? _theme.appColor[0] : _theme.appColor[2],
        systemNavigationBarIconBrightness: Brightness.light,
      )
    );
  }

  ThemeData get myTheme => _themeData;

  static ThemeManager? _instance;

  ThemeManager._init();

  factory ThemeManager() => _instance ??= ThemeManager._init();
  
}