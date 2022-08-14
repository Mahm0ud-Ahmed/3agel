import 'package:retrofit/dio.dart';
import 'package:aagel/src/core/utils/query_params.dart';
import 'package:aagel/src/data/data_sources/remote/api_service.dart';
import 'package:aagel/src/domain/repositories/i_app_repository.dart';

class AppRepositoryImp extends IAppRepository{
  final ApiService _apiService;

  AppRepositoryImp(this._apiService);
  
  @override
  Future<HttpResponse> getAllData(QueryParams params) async {
    return await _apiService.getApiData(
      // apiKey: params.apiKey,
      querySearch: params.queryWord,
      endpoint: params.endpoint,
      page: params.page.toString(),
      pageSize: params.pageSize.toString(),
    );
  }
  
  @override
  Future<HttpResponse> getShowDataByPath(QueryParams params) async {
    return await _apiService.getApiDataByPath(
      // apiKey: params.apiKey,
      querySearch: params.queryWord,
      endpoint: params.endpoint,
      pathId: params.pathId!,
    );
  }
}