
import 'package:aagel/src/data/models/article_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:aagel/src/core/utils/query_params.dart';

abstract class IAppRepository{

  Future<HttpResponse> getAllData(QueryParams params);
  Future<HttpResponse> getShowDataByPath(QueryParams params);
  
  Future<List<ArticleModel>> getCacheData();
  Future<bool> storeLocal(ArticleModel article);
  Future<bool> deleteLocal(String url);
  Future<bool> checkArticle(String url);
}