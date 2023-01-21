
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:aagel/src/core/error/error_handler.dart';
import 'package:aagel/src/core/usecase/usecase.dart';
import 'package:aagel/src/core/utils/data_reflection.dart';
import 'package:aagel/src/core/utils/data_state.dart';
import 'package:aagel/src/core/utils/query_params.dart';
import 'package:aagel/src/domain/repositories/i_app_repository.dart';

class GetDataByPathUseCase<MODEL> extends UseCase<QueryParams>{

  final IAppRepository _appRepository;
  DataReflection<MODEL>? _reflection;

  GetDataByPathUseCase(this._appRepository);
  
  @override
  Future<DataState<MODEL>> call({QueryParams? params}) async {
    _reflection = DataReflection();
    try {
      HttpResponse response = await _appRepository.getShowDataByPath(params!);
      if(response.response.statusCode == HttpStatus.ok){
        DataState<MODEL> dataModel = _reflection!.reflectResponse<MODEL>(response);
        return dataModel;
      }else{
        return DataState.failure(ErrorHandler.handleError(response.data));
      }
    } on DioError catch (error) {
      return DataState.failure(ErrorHandler.handleError(error));
    }
  }
}