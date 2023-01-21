
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:aagel/src/core/error/error_handler.dart';
import 'package:aagel/src/core/usecase/usecase.dart';
import 'package:aagel/src/core/utils/data_reflection.dart';
import 'package:aagel/src/core/utils/data_state.dart';
import 'package:aagel/src/core/utils/query_params.dart';
import 'package:aagel/src/domain/repositories/i_app_repository.dart';

class GetCollectionDataUseCase<MODEL> extends UseCase<QueryParams>{

  final IAppRepository _appRepository;
  DataReflection<List<MODEL>>? _reflection;

  GetCollectionDataUseCase(this._appRepository);
  
  @override
  Future<DataState> call({QueryParams? params}) async {
    _reflection = DataReflection();
    try {
      HttpResponse response = await _appRepository.getAllData(params!);
      if(response.response.statusCode == HttpStatus.ok){
        DataState dataModel = _reflection!.reflectResponse<MODEL>(response);
        return DataState.success(dataModel);
      }else{
        return DataState.failure(ErrorHandler.handleError(response.data));
      }
    } on DioError catch (error) {
      return DataState.failure(ErrorHandler.handleError(error));
    }
  }
}