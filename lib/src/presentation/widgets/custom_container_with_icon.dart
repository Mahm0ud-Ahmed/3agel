import 'package:flutter/material.dart';

import '../../core/config/themes/theme_manager.dart';

class CustomContainerWithIcon extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Widget child;
  const CustomContainerWithIcon({
    super.key,
    required this.child,
    this.height = 36,
    this.width = 36,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor ?? ThemeManager().themes.appColor[3],
          borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child: child,
        )
      ),
    );
  }
}