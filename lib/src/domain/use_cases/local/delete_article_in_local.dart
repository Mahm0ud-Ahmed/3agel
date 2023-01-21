import 'package:hive/hive.dart';

import '../../../core/error/error_handler.dart';
import '../../../core/usecase/usecase.dart';
import '../../../core/utils/data_state.dart';
import '../../repositories/i_app_repository.dart';

class DeleteArticleInLocal extends UseCase<String>{

  final IAppRepository _appRepository;

  DeleteArticleInLocal(this._appRepository);
  
  @override
  Future<DataState<bool>> call({String? params}) async{
    try {
      bool isDeleteSuccessfully = await _appRepository.deleteLocal(params!);
      return DataState.success(isDeleteSuccessfully);
    } on HiveError catch (error) {
      return DataState.failure(ErrorHandler.handleError(error));
    }  
  }

}