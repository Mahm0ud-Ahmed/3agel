import 'package:flutter/material.dart';

extension DeviceOptions on BuildContext{
  Size get screenSize{
    return MediaQuery.of(this).size;
  }
  
  bool get isPortrait{
    return MediaQuery.of(this).orientation == Orientation.portrait;
  }
}