import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // ApiDataBloc<ArticleModel> bloc = ApiDataBloc(query: QueryParams(category: 'general', pageSize: 5), maxResult: 5)..add(ApiDataPagination());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.indigo,
      child: Text('Bookmark')
    );

  }
}