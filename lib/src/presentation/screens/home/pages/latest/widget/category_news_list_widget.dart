import 'package:aagel/src/data/models/article_model.dart';
import 'package:aagel/src/presentation/widgets/custom_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../controllers/data_bloc/api_data_bloc.dart';
import '../../../../../widgets/category_news_item_widget.dart';

class CategoryNewsList extends StatelessWidget {
  final ApiDataBloc<ArticleModel>? articleBloc;

  const CategoryNewsList({
    super.key,
    required this.articleBloc,
  });

  @override
  Widget build(BuildContext context) {
    return PagedSliverGrid(
      pagingController: articleBloc!.controller,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        mainAxisExtent: 120,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      builderDelegate: PagedChildBuilderDelegate<ArticleModel>(
        itemBuilder: (context, item, index) {
          return CategoryNewsItemWidget(
            article: item,
          );
        },
        firstPageProgressIndicatorBuilder: (context) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              mainAxisExtent: 120,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return const CustomShimmerWidget(
                height: 120,
                width: 400,
                radius: 16,
              );
            },
            shrinkWrap: true,
            primary: false,
          );
        },
        newPageProgressIndicatorBuilder: (context) {
          return const CustomShimmerWidget(
            height: 120,
            width: 400,
            radius: 16,
          );
        },
        newPageErrorIndicatorBuilder: (context) {
          return Center(
            child: Text(articleBloc!.controller.error!.message ?? ''),
          );
        },
        firstPageErrorIndicatorBuilder: (context) {
          return Center(
            child: Text(articleBloc?.controller.error.message),
          );
        },
      ),
      shrinkWrapFirstPageIndicators: true,
    );
  }
}
