import 'package:aagel/src/presentation/controllers/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/enums.dart';

class SearchController extends Cubit<SearchModel> {
  SearchController() : super(SearchModel());
  SearchModel? searchModel;

  static SearchController of(BuildContext context) => BlocProvider.of(context);

  saveSearch({String? searchCharacter, NewsCategory? category}) {
    searchModel =
        SearchModel(searchCharacter: searchCharacter, category: category);
    emit(searchModel!);
  }
}
