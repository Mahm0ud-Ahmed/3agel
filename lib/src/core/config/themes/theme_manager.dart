import 'package:aagel/src/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/storage_service.dart';
import '../injector.dart';
import 'dark_theme.dart';
import 'i_theme.dart';
import 'light_theme.dart';

class ThemeManager extends ChangeNotifier {
  late ITheme _theme;
  late ThemeData _themeData;
  late ThemeMode _mode;
  bool _isDark = false;
  final StorageService _storage = injector();
  late List<Color> appColor;
  late Map<ThemeTextStyle, TextStyle> appStyle;

  load() {
    _isDark = _storage.getBool(Constant.kThemeModeKey) ?? false;

    initialCurrentThemeApp();
    appColor = _theme.appColor;
    appStyle = _theme.appStyle;
    setThemeData();
    setSystemStatusDefaultColor();

    notifyListeners();
  }

  initialCurrentThemeApp() {
    if (_isDark) {
      _theme = DarkTheme();
      _mode = ThemeMode.dark;
    } else {
      _theme = LightTheme();
      _mode = ThemeMode.light;
    }
  }

  changeThemeMode(ITheme theme) {
    _theme = theme;
    initialCurrentThemeByTheme();
    appColor = _theme.appColor;
    appStyle = _theme.appStyle;
    setThemeData();
    setSystemStatusDefaultColor();
    notifyListeners();
  }

  initialCurrentThemeByTheme() {
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

  // ITheme get themes => _theme;

  bool get isLight => mode == ThemeMode.light ? true : false;

  void setThemeData() {
    _themeData = ThemeData(
        primarySwatch: _theme.primarySwatch,
        primaryColor: _theme.color[0],
        scaffoldBackgroundColor: _theme.color[0],
        hintColor: _theme.color[0],
        primaryColorDark: _theme.color[6],
        appBarTheme: AppBarTheme(
          backgroundColor: _theme.color[0],
          foregroundColor: _theme.color[6],
        ),
        brightness: isLight ? Brightness.light : Brightness.dark,
        fontFamily: Typography.whiteMountainView.displayLarge?.fontFamily,
        textTheme: !isLight
            ? Typography.whiteMountainView
            : Typography.blackMountainView);
  }

  void setSystemStatusDefaultColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: _theme.appColor[0],
      statusBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
      statusBarBrightness: isLight ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: _theme.primarySwatch,
      systemNavigationBarDividerColor:
          isLight ? _theme.appColor[0] : _theme.appColor[6],
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }

  ThemeData get myTheme => _themeData;

  static ThemeManager? _instance;

  ThemeManager._init();

  factory ThemeManager() => _instance ??= ThemeManager._init();
}
