import 'package:hive/hive.dart';

import '../../../core/error/error_handler.dart';
import '../../../core/usecase/usecase.dart';
import '../../../core/utils/data_state.dart';
import '../../repositories/i_app_repository.dart';

class CheckInBookmark extends UseCase<String>{

  final IAppRepository _appRepository;

  CheckInBookmark(this._appRepository);
  
  @override
  Future<DataState<bool>> call({String? params}) async{
    try {
      bool isBookmark = await _appRepository.checkArticle(params!);
      return DataSuccess<bool>(isBookmark);
    } on HiveError catch (error) {
      return DataFailed(ErrorHandler.handleError(error));
    }  
  }
  

}