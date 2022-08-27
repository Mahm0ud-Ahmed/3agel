import 'package:flutter/material.dart';
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