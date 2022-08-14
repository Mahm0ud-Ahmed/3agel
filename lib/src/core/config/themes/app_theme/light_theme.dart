import 'package:flutter/material.dart';

import 'i_theme.dart';

class LightTheme implements ITheme{
  
  @override
  late List<Color> color;
  
  @override
  late Map<ThemeTextStyle, TextStyle> style;

  @override
  MaterialColor primarySwatch = Colors.blue;

  @override
  List<Color> get appColor {
    return color = [
      Colors.grey.shade200,
      Colors.black,
      Colors.green,

    ];
  }

  @override
  Map<ThemeTextStyle, TextStyle> get appStyle {
    return style = {
      ThemeTextStyle.body : TextStyle(color: color[1], fontSize: 16,),
      ThemeTextStyle.subtitle1 : TextStyle(color: color[2], fontSize: 24,),
      ThemeTextStyle.subtitle2 : TextStyle(color: color[0], fontSize: 40,),
    };
  }
  

}