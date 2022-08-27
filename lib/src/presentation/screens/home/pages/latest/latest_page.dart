import 'package:aagel/src/core/config/themes/theme_manager.dart';
import 'package:aagel/src/presentation/widgets/custom_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'widget/carousel_header_widget.dart';

class LatestPage extends StatelessWidget {
  const LatestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselHeaderWidget(),
          
          
        ],
      ),
    );

  }
}