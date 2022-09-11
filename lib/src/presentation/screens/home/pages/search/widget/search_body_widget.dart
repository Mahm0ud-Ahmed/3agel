import 'package:aagel/src/core/config/assets/assets.gen.dart';
import 'package:aagel/src/data/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../controllers/data_bloc/api_data_bloc.dart';
import '../../../../../widgets/custom_shimmer_widget.dart';
import '../../../../../widgets/category_news_item_widget.dart';

class SearchBodyWidget extends StatelessWidget {
  final ApiDataBloc<ArticleModel> searchBloc;
  final ValueNotifier<bool?> notifier;
  const SearchBodyWidget({
    super.key,
    required this.searchBloc,
    required this.notifier,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            !notifier.value!
                ? AspectRatio(
                    aspectRatio: 1,
                    child: Assets.images.searchingData.svg(),
                  )
                : Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: PagedGridView(
                            pagingController: searchBloc.controller,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 400,
                              mainAxisExtent: 120,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            builderDelegate:
                                PagedChildBuilderDelegate<ArticleModel>(
                              itemBuilder: (context, item, index) {
                                return CategoryNewsItemWidget(
                                  article: item,
                                );
                              },
                              firstPageProgressIndicatorBuilder: (context) {
                                return Column(
                                  children: List.generate(
                                    10,
                                    (index) => const CustomShimmerWidget(
                                      height: 120,
                                      width: 400,
                                      radius: 16,
                                    ),
                                  ),
                                );
                              },
                              noItemsFoundIndicatorBuilder: (context) {
                                return Assets.images.noData.svg();
                              },
                              newPageProgressIndicatorBuilder: (context) {
                                return const CustomShimmerWidget(
                                  height: 120,
                                  width: 400,
                                  radius: 16,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
          ],
        );
      },
    );
  }
}
