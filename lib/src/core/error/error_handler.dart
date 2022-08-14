import 'dart:io';

import 'package:dio/dio.dart';

import '../config/l10n/generated/l10n.dart';
import 'error_model.dart';

class ErrorHandler{

  static ErrorModel handleError(DioError error){
    late ErrorModel errorModel;
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.other:
        errorModel = ErrorModel(
          status: S.current.handle_error_status_connect_time_out,
          message: S.current.handle_error_message_connect_time_out,
        );
        break;
      case DioErrorType.cancel:
        errorModel = ErrorModel(
          status: S.current.handle_error_status_cancel,
          message: S.current.handle_error_message_cancel,
        );
        break;
      case DioErrorType.response:
        if(error.response?.statusCode == HttpStatus.badRequest){
          errorModel = ErrorModel.fromJson(error.response?.data);
        }else if(error.response?.statusCode == HttpStatus.notFound){
          errorModel = ErrorModel(
            status: error.response?.statusMessage,
            message: error.message,
          );
        }
        break;
    }
    return errorModel;
  }
}