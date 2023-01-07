import 'package:aagel/src/data/data_sources/local/local_service.dart';
import 'package:aagel/src/data/models/article_model.dart';
import 'package:retrofit/dio.dart';
import 'package:aagel/src/core/utils/query_params.dart';
import 'package:aagel/src/domain/repositories/i_app_repository.dart';

import '../../core/services/storage_service.dart';
import '../../core/utils/constant.dart';
import '../data_sources/remote/api_service.dart';

class AppRepositoryImp extends IAppRepository{
  final ApiService _apiService;
  final LocalService _localService;

  AppRepositoryImp(this._apiService, this._localService);
  
  @override
  Future<HttpResponse> getAllData(QueryParams params) async {
    return await _apiService.getApiData(
      apiKey: params.apiKey,
      querySearch: params.queryWord,
      endpoint: params.endpoint!,
      page: params.page.toString(),
      pageSize: params.pageSize.toString(),
      category: params.category,
      country: params.country ?? StorageService().getString(Constant.kLocaleCountryCode) ?? 'us',
      from: params.from,
      to: params.to,
      language: params.language ?? StorageService().getString(Constant.kLocaleLanguageCode) ?? 'en',
      searchIn: params.searchIn,
      sortBy: params.sortBy,
      sources: params.sources,
    );
  }
  
  @override
  Future<HttpResponse> getShowDataByPath(QueryParams params) async {
    return await _apiService.getApiDataByPath(
      // apiKey: params.apiKey,
      querySearch: params.queryWord,
      endpoint: params.endpoint!,
      pathId: params.pathId!,
    );
  }

  @override
  Future<List<ArticleModel>> getCacheData() async{
    return await _localService.getAllArticle();
  }
  
  @override
  Future<bool> deleteLocal(String url) async{
    return await _localService.removeArticle(url);
  }
  
  @override
  Future<bool> storeLocal(ArticleModel article) async{
    return await _localService.addArticle(article);
  }
  
  @override
  Future<bool> checkArticle(String url) async{
    return await _localService.checkArticle(url);
  }
}