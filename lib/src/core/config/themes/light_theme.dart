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
      /* index = 0 */    const Color(0xFFFFFFFF),
      /* index = 1 */    const Color(0xFF2B3A4B),
      /* index = 2 */    const Color(0xFFFAECF0),
      /* index = 3 */    const Color(0xFFFF6861),
      /* index = 4 */    const Color(0xFFFF6962),
      /* index = 5 */    const Color(0xFFFF7872),
      /* index = 6 */    const Color(0xFFF4F6F9),
      /* index = 7 */    const Color(0xFF1A1B22),
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