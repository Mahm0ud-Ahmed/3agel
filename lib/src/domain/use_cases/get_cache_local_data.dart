import 'package:hive/hive.dart';

import '../../core/error/error_handler.dart';
import '../../core/usecase/usecase.dart';
import '../../core/utils/data_state.dart';
import '../../data/models/article_model.dart';
import '../repositories/i_app_repository.dart';

class GetCacheLocalData extends UseCase<void>{

  final IAppRepository _appRepository;

  GetCacheLocalData(this._appRepository);
  
  @override
  Future<DataState> call({void params}) async{
    try {
      List<ArticleModel> articles = await _appRepository.getCacheData();
      return DataSuccess(articles);
    } on HiveError catch (error) {
      return DataFailed(ErrorHandler.handleError(error));
    }  
  }
  

}