import 'package:aagel/src/data/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../controllers/data_bloc/api_data_bloc.dart';
import 'category_news_item_widget.dart';

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
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      builderDelegate: PagedChildBuilderDelegate<ArticleModel>(
        itemBuilder: (context, item, index) {
          return CategoryNewsItemWidget(
            article: item,
          );
        },
      ),
    );
  }
}
