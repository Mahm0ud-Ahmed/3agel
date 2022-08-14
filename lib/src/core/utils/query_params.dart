
class QueryParams{
  // final String? apiKey;
  String endpoint;
  String? pathId;
  String? queryWord;
  // final String? sortBy;
  // final String? language;
  // final String? sources;
  // final String? searchIn;
  // final String? from;
  // final String? to;
  // final String? country;
  // final String? category;
  int? pageSize;
  int? page;

  QueryParams({
    required this.endpoint,
    // this.apiKey = ConstantValue.kApiKey,
    this.pathId,
    this.queryWord,
    // this.sortBy,
    // this.language,
    // this.sources,
    // this.searchIn,
    // this.from,
    // this.to,
    // this.country,
    // this.category,
    // this.pageSize,
    this.page,
  }
);

}