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
          _articlesNotifier.value = List.from(state.data!.reversed.toList());
          return ValueListenableBuilder<List<ArticleModel>?>(
            valueListenable: _articlesNotifier,
            builder: (context, List<ArticleModel>? articles, child) {
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                itemCount: articles!.length,
                itemBuilder: (context, index) {
                  return CategoryNewsItemWidget(
                    article: articles[index],
                    onDelete: (article) {
                      articles.remove(article);
                      _articlesNotifier.value = List.from(articles);
                      if(articles.isEmpty){
                        bloc.add(GetDataStore(Constant.kBoxNameHive));
                      }
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
        } else if(state is ApiDataLoaded<List<ArticleModel>?> && state.data!.isEmpty){
          return const Center(
            child: Text('There are not data')
          );
        }
        return GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            mainAxisExtent: 120,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          children: List.generate(5, (index) => 
            const CustomShimmerWidget(
              height: 120,
              width: 400,
              radius: 16,
            ),
          ),
        );
      },
    );

  }
}