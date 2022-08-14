import 'package:aagel/src/core/services/service_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:aagel/src/core/utils/constant.dart';

class DioService implements ServiceInterface{
  static late final Dio _dio;

  @override
  String get name => "Api";

  @override
  Future initialize() async {
    _dio = Dio(_baseOptions());
    if(!kReleaseMode){
      _dio.interceptors.add(
        LogInterceptor(
          error: false,
          request: false,
          requestHeader: false,
          requestBody: false,
          responseHeader: true,
          responseBody: false,
        )
      );
    }
    return _dio;  
  }

  static BaseOptions _baseOptions(){
    return BaseOptions(
      baseUrl: Constant.kBaseUrl,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
      sendTimeout: 60 * 1000,
      contentType: "application/json",
    );
  }
  
}