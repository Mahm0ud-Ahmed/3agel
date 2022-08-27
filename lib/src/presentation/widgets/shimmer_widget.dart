// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/config/themes/theme_manager.dart';

class ShimmerWidget extends StatelessWidget {
  
  final Color? baseColor;
  final Color? highlightColor;
  final Widget child;

  const ShimmerWidget({
    super.key,
    this.baseColor,
    this.highlightColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? ThemeManager().appColor[5].withOpacity(0.2),
      highlightColor: highlightColor ?? ThemeManager().appColor[5].withOpacity(0.01),
      enabled: true,
      child: child,
    );
  }
}


/* 
SizedBox(
        height: 200,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.white),
        ),
      ),
 */