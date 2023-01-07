import 'package:aagel/src/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/article_model.dart';
import '../../../../controllers/data_bloc/api_data_bloc.dart';
import '../../../../widgets/category_news_item_widget.dart';
import '../../../../widgets/custom_shimmer_widget.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  late final ApiDataBloc<ArticleModel> bloc;
  late final ValueNotifier<List<ArticleModel>?> _articlesNotifier;

  @override
  void initState() {
    super.initState();
    bloc = ApiDataBloc()..add(GetDataStore(Constant.kBoxNameHive));
    _articlesNotifier = ValueNotifier(null);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if(state is ApiDataLoaded<List<ArticleModel>?> && state.data!.isNotEmpty){
          List<ArticleModel> articles = state.data!.reversed.toList();
          _articlesNotifier.value = List.from(articles);
          return ValueListenableBuilder<List<ArticleModel>?>(
            valueListenable: _articlesNotifier,
            builder: (context, value, child) {
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                itemCount: value!.length,
                itemBuilder: (context, index) {
                  return CategoryNewsItemWidget(
                    article: value[index],
                    onDelete: (article) {
                      articles.remove(article);
                      _articlesNotifier.value = List.from(articles);
                    },
                  );
                },
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  mainAxisExtent: 120,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
              );
            },
          );
        } else if(state is ApiDataLoaded && state.data!.isEmpty){
          const Text('That not are date');
        }
        return SingleChildScrollView(
          child: Column(
              children: List.generate(
                10,
                (index) => const CustomShimmerWidget(
                  height: 120,
                  width: 400,
                  radius: 16,
                ),
              ),
            ),
        );
      },
    );

  }
}