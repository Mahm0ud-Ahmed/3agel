import 'package:hive/hive.dart';

import '../../../core/error/error_handler.dart';
import '../../../core/usecase/usecase.dart';
import '../../../core/utils/data_state.dart';
import '../../../data/models/article_model.dart';
import '../../repositories/i_app_repository.dart';

class SaveArticleInLocal extends UseCase<ArticleModel>{

  final IAppRepository _appRepository;

  SaveArticleInLocal(this._appRepository);
  
  @override
  Future<DataState<bool>> call({ArticleModel? params}) async{
    try {
      bool isSaveSuccessfully = await _appRepository.storeLocal(params!);
      return DataSuccess<bool>(isSaveSuccessfully);
    } on HiveError catch (error) {
      return DataFailed(ErrorHandler.handleError(error));
    }  
  }
  

}