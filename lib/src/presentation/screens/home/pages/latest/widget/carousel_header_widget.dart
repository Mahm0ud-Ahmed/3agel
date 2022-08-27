import 'package:aagel/src/core/config/themes/theme_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/config/assets/assets.gen.dart';
import '../../../../../../core/config/assets/fonts.gen.dart';
import '../../../../../../core/utils/query_params.dart';
import '../../../../../../data/models/api_pagination_model.dart';
import '../../../../../../data/models/article_model.dart';
import '../../../../../controllers/data_bloc/api_data_bloc.dart';

class CarouselHeaderWidget extends StatelessWidget {
  final ApiDataBloc<ArticleModel> carouselBloc = ApiDataBloc(query: QueryParams(category: 'sport', pageSize: 5), maxResult: 5)..add(ApiDataPagination());

  final ValueNotifier<int> _notifier = ValueNotifier<int>(0);

  CarouselHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: BlocBuilder(
        bloc: carouselBloc,
        builder: (context, state) {
          if(state is ApiDataLoaded<ApiPaginationModel<ArticleModel>>) {
            List<ArticleModel>? article = state.data!.data;
            return Column(
              children: [
                CarouselSlider.builder(
                itemCount: state.data!.data?.length,
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 0.92,
                  enableInfiniteScroll: true,
                  reverse: true,
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
                itemBuilder: (
                  BuildContext context, int itemIndex, int pageViewIndex) {
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
                              fit: BoxFit.cover
                            ),
                            errorWidget: (context, url, error) => Assets.images.noImage.svg(
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 80,
                              width: double.infinity,
                              child: DecoratedBox(
                                decoration: const BoxDecoration(
                                  color: Colors.black38
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(top: 8, start: 8),
                                  child: Text(
                                    article[itemIndex].title!,
                                    style: const TextStyle(fontFamily: FontFamily.roboto, fontSize: 16, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis, height: 1.3, color: Colors.white),
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
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(state.data!.data!.length, (index) {
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
                                color: _notifier.value == index ? ThemeManager().themes.color[3] : ThemeManager().themes.color[5],
                                borderRadius: BorderRadius.circular(8)
                              )
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
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}