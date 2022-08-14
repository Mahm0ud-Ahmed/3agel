import 'package:flutter/material.dart';

abstract class ITheme{
  ITheme._();
  late Map<ThemeTextStyle, TextStyle> style;
  late List<Color> color;
  late MaterialColor primarySwatch;

  Map<ThemeTextStyle, TextStyle> get appStyle;
  List<Color> get appColor;

}

enum ThemeTextStyle{
  body,
  subtitle1,
  subtitle2,
}