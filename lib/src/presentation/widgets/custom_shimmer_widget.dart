import 'package:aagel/src/presentation/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

class CustomShimmerWidget extends StatelessWidget {
  final Color? baseColor;
  final Color? highlightColor;

  final double? height;
  final double? width;
  final double? radius;
  final EdgeInsets? margin;

  const CustomShimmerWidget(
      {super.key,
      this.baseColor,
      this.highlightColor,
      this.height,
      this.width,
      this.radius,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(8.0),
      child: ShimmerWidget(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: SizedBox(
          height: height ?? width,
          width: width ?? height,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(radius?? 0),
            ),
          ),
        ),
      ),
    );
  }
}
