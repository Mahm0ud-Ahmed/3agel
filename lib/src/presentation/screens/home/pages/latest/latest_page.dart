import 'package:flutter/material.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/query_params.dart';
import '../../../../../data/models/article_model.dart';
import '../../../../controllers/data_bloc/api_data_bloc.dart';
import 'widget/carousel_header_widget.dart';
import 'widget/category_news_list_widget.dart';
import 'widget/category_news_widget.dart';

class LatestPage extends StatefulWidget {
  const LatestPage({super.key});

  @override
  State<LatestPage> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {
  final QueryParams _query = QueryParams(
    category: NewsCategory.business.category,
    pageSize: 10,
  );

  ApiDataBloc<ArticleModel>? _articleBloc;

  late ValueNotifier<NewsCategory> categoryListen;

  @override
  void initState() {
    super.initState();
    _articleBloc = ApiDataBloc(maxResult: 10, query: _query);
    categoryListen = ValueNotifier(NewsCategory.business);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: CarouselHeaderWidget(),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 12),
          sliver: SliverToBoxAdapter(
            child: CategoryNewsWidget(
              onTab: updateListeners,
              categoryListen: categoryListen,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          sliver: CategoryNewsList(articleBloc: _articleBloc!),
        ),
      ],
    );
  }

  void updateListeners(NewsCategory newCategory) {
    categoryListen.value = newCategory;
    _query.category = newCategory.category;
    _articleBloc?.controller.refresh();
  }
}
