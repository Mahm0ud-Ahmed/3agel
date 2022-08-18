
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:aagel/src/core/utils/constant.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Constant.kBaseUrl)
abstract class ApiService{

  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('{endpoint}')
  Future<HttpResponse> getApiData({
    @Path('endpoint') required String endpoint,
    @Query("q") String? querySearch,
    @Query("sortBy") String? sortBy,
    @Query("language") String? language,
    @Query("sources") String? sources,
    @Query("searchIn") String? searchIn,
    @Query("from") String? from,
    @Query("to") String? to,
    @Query("country") String? country,
    @Query("category") String? category,
    @Query("pageSize") String? pageSize,
    @Query("page") String? page,
    @Query("apiKey") String? apiKey,
  });

  @GET('{endpoint}/{id}')
  Future<HttpResponse> getApiDataByPath({
    @Path('endpoint') required String endpoint,
    @Path('id') required String pathId,
    @Query("q") String? querySearch,
    @Query("apiKey") String? apiKey,
    @Query("pageSize") String? pageSize,
    @Query("page") String? page,
  });
}