import 'package:aagel/src/core/utils/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/config/assets/assets.gen.dart';
import '../../../../../../core/config/assets/fonts.gen.dart';
import '../../../../../../core/config/themes/theme_manager.dart';
import '../../../../../../data/models/article_model.dart';

class CarouselItemLoadedWidget extends StatelessWidget {
  final List<ArticleModel>? article;
  final ValueNotifier<int> _notifier = ValueNotifier<int>(0);
  final double height;

  CarouselItemLoadedWidget({super.key, required this.article, required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: article?.length,
          options: CarouselOptions(
            // height: context.isPortrait ? context.screenSize.height * 0.41 : context.screenSize.height * 0.60,
            height: height,
            viewportFraction: 0.92,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 15),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              _notifier.value = index;
            },
          ),
          itemBuilder:
          
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: article![itemIndex].urlToImage ?? '',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Assets.images.noImage.svg(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    errorWidget: (context, url, error) =>
                        Assets.images.noImage.svg(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(color: Colors.black38),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 8, start: 8),
                          child: Text(
                            article![itemIndex].title!,
                            style: const TextStyle(
                                fontFamily: FontFamily.roboto,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.ellipsis,
                                height: 1.3,
                                color: Colors.white),
                            maxLines: 2,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(article!.length, (index) {
            return SizedBox(
              width: 12,
              height: 8,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(end: 4),
                child: ValueListenableBuilder(
                  valueListenable: _notifier,
                  builder: (context, value, child) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: _notifier.value == index
                            ? ThemeManager().appColor[3]
                            : ThemeManager().appColor[5],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
