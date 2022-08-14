import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:aagel/src/core/utils/constant_value.dart';

class DioClient{
  static late final Dio _dio;

  static Dio initialDio(){
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
      baseUrl: ConstantValue.kBaseUrl,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
      sendTimeout: 60 * 1000,
      contentType: "application/json",
    );
  }
}