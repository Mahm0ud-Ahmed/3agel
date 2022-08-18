
import 'package:aagel/src/core/utils/constant.dart';

class QueryParams{
  final String? apiKey;
  String? endpoint;
  String? pathId;
  String? queryWord;
  String? sortBy;
  String? language;
  String? sources;
  String? searchIn;
  String? from;
  String? to;
  String? country;
  String? category;
  int? pageSize;
  int? page;

  QueryParams({
    this.endpoint,
    this.apiKey = Constant.kApiKey,
    this.pathId,
    this.queryWord,
    this.sortBy,
    this.language,
    this.sources,
    this.searchIn,
    this.from,
    this.to,
    this.country,
    this.category,
    this.pageSize,
    this.page,
  }
);

}