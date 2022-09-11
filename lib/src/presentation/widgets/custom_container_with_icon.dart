import 'package:flutter/material.dart';

import '../../core/config/themes/theme_manager.dart';

class CustomContainerWithIcon extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final Widget child;
  final VoidCallback? onClick;
  const CustomContainerWithIcon({
    super.key,
    required this.child,
    this.height = 36,
    this.width = 36,
    this.margin,
    this.backgroundColor,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onClick,
        child: SizedBox(
          height: height,
          width: width,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: backgroundColor ?? ThemeManager().appColor[3],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
