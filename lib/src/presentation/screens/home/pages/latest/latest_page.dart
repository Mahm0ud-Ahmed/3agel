import 'package:flutter/material.dart';

class LatestPage extends StatefulWidget {
  const LatestPage({super.key});

  @override
  State<LatestPage> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {
  // ApiDataBloc<ArticleModel> bloc = ApiDataBloc(query: QueryParams(category: 'general', pageSize: 5), maxResult: 5)..add(ApiDataPagination());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.red,
      child: Text('Bookmark')
    );

  }
}