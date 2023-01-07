import 'package:aagel/src/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/article_model.dart';
import '../../../../controllers/data_bloc/api_data_bloc.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  late final ApiDataBloc<ArticleModel> bloc;
  @override
  void initState() {
    super.initState();
    bloc = ApiDataBloc()..add(GetDataStore(Constant.kBoxNameHive));
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        print(state);
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: Text('Bookmark')
        );
      },
    );

  }
}