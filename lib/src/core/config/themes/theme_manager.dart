import 'package:flutter/material.dart';

import 'app_theme/dark_theme.dart';
import 'app_theme/i_theme.dart';
import 'app_theme/light_theme.dart';

class ThemeManager extends ChangeNotifier{

  late ITheme theme;
  late ThemeData _themeData;
  late ThemeMode _mode;

  void initTheme(ITheme argTheme){
    // if(argTheme is LightTheme){
    //   theme = LightTheme();
    // }else{
    //   theme = DarkTheme();
    // }
    theme = argTheme;
    theme.appColor;
    theme.appStyle;
    setMode(theme);
    setThemeData();
    notifyListeners();
  }

  setMode(ITheme iTheme){
    switch(iTheme.runtimeType){
      case LightTheme:
        _mode = ThemeMode.light;
        break;
      case DarkTheme:
        _mode = ThemeMode.dark;
        break;
        
      default:
        _mode = ThemeMode.light;
        break;
    }
  }

  ThemeMode get mode => _mode;

  bool get isLight => mode == ThemeMode.light ? true : false;

  void setThemeData() {
    _themeData = ThemeData(
      scaffoldBackgroundColor: theme.color[0],
      primarySwatch: theme.primarySwatch,
      appBarTheme: AppBarTheme(color: theme.primarySwatch),
      brightness: isLight ? Brightness.light : Brightness.dark,
    );
  }

  ThemeData get myTheme => _themeData;

  static ThemeManager? _instance;

  ThemeManager._init();

  factory ThemeManager() { return _instance ??= ThemeManager._init();}
}