import 'package:aagel/src/core/utils/constant.dart';
import 'package:aagel/src/presentation/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/config/l10n/generated/l10n.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/query_params.dart';
import '../../../../../data/models/article_model.dart';
import '../../../../controllers/data_bloc/api_data_bloc.dart';
import '../../../../controllers/navigation_bar_controller.dart';
import '../../../../widgets/custom_container_with_icon.dart';
import '../../../../widgets/header_search_widget.dart';
import 'widget/carousel_header_widget.dart';
import 'widget/category_news_list_widget.dart';
import 'widget/category_news_widget.dart';

class LatestPage extends StatefulWidget {
  const LatestPage({super.key});

  @override
  State<LatestPage> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {
  late final ApiDataBloc<ArticleModel> _carouselBloc;
  late final ApiDataBloc<ArticleModel> _articleBloc;
  late final ValueNotifier<NewsCategory> _categoryListen;
  String? searchCharacter;
  NewsCategory? category;

  final QueryParams _query = QueryParams(
    endpoint: Constant.kRouteTopHeadline,
    category: NewsCategory.business.category,
    pageSize: 10,
  );

  @override
  void initState() {
    super.initState();
    _carouselBloc = ApiDataBloc<ArticleModel>(
        query: QueryParams(endpoint: Constant.kRouteTopHeadline, category: NewsCategory.general.category, pageSize: 5),
        maxResult: 5)
      ..add(ApiDataPagination());

    _articleBloc = ApiDataBloc<ArticleModel>(maxResult: 10, query: _query);
    _categoryListen = ValueNotifier(NewsCategory.business);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _carouselBloc.add(ApiDataPagination());
        _articleBloc.controller.refresh();
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Row(
              children: [
                const CustomContainerWithIcon(
                  child: FaIcon(
                    FontAwesomeIcons.globe,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(S().app_bar_title),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: HeaderSearchWidget(
              onChange: (search) => searchCharacter = search,
              onChoose: (cat) => category = cat,
              categoryNotifier: ValueNotifier(null),
              onTab: () {
                SearchController.of(context).saveSearch(
                    searchCharacter: searchCharacter, category: category);
                NavigationBarController.of(context).setIndex(1);
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          SliverToBoxAdapter(
            child: CarouselHeaderWidget(carouselBloc: _carouselBloc),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            sliver: SliverToBoxAdapter(
              child: CategoryNewsWidget(
                onTab: updateListeners,
                categoryListen: _categoryListen,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: CategoryNewsList(articleBloc: _articleBloc),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
            ),
          ),
        ],
      ),
    );
  }

  void updateListeners(NewsCategory newCategory) {
    if (newCategory != _categoryListen.value &&
        newCategory.category != _query.category) {
      _categoryListen.value = newCategory;
      _query.category = newCategory.category;
      _articleBloc.controller.refresh();
    }
  }
}
