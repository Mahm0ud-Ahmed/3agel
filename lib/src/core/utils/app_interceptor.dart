import 'package:dio/dio.dart';

import 'custom_logger.dart';

class AppInterceptor extends Interceptor {
  AppInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = false,
    this.responseHeader = true,
    this.responseBody = false,
    this.error = true,
    this.logPrint = print,
  });

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.data]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  void Function(Object object) logPrint;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // CustomLogger.logDebug('*** Request ***');
    CustomLogger.logInfo(
        'Request | ${options.queryParameters}\n${options.method} | ${options.uri}');
    // logPrint('*** Request ***');
    // _printKV('uri', options.uri);
    //options.headers;

    // if (request) {
    //   _printKV('method', options.method);
    //   _printKV('responseType', options.responseType.toString());
    //   _printKV('followRedirects', options.followRedirects);
    //   _printKV('connectTimeout', options.connectTimeout);
    //   _printKV('sendTimeout', options.sendTimeout);
    //   _printKV('receiveTimeout', options.receiveTimeout);
    //   _printKV(
    //       'receiveDataWhenStatusError', options.receiveDataWhenStatusError);
    //   _printKV('extra', options.extra);
    // }
    // if (requestHeader) {
    //   logPrint('headers:');
    //   options.headers.forEach((key, v) => _printKV(' $key', v));
    // }
    // if (requestBody) {
    //   logPrint('data:');
    //   _printAll(options.data);
    // }
    // logPrint('');

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // CustomLogger.logDebug('*** Response ***');
    CustomLogger.logInfo(
        'Response | ${response.requestOptions.queryParameters}\nApi | ${response.requestOptions.uri}\nstatusCode | ${response.statusCode}');

    // logPrint('*** Response ***');
    // _printResponse(response);
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    CustomLogger.logError(
        'DioError | ${err.requestOptions.uri}\nError | $err\nErrorResponse | ${err.response}');
    // if (error) {
    //   logPrint('*** DioError ***:');
    //   logPrint('uri: ${err.requestOptions.uri}');
    //   logPrint('$err');
    //   if (err.response != null) {
    //     _printResponse(err.response!);
    //   }
    //   logPrint('');
    // }

    handler.next(err);
  }

  void _printResponse(Response response) {
    _printKV('uri', response.requestOptions.uri);
    if (responseHeader) {
      _printKV('statusCode', response.statusCode);
      if (response.isRedirect == true) {
        _printKV('redirect', response.realUri);
      }

      logPrint('headers:');
      response.headers.forEach((key, v) => _printKV(' $key', v.join('\r\n\t')));
    }
    if (responseBody) {
      logPrint('Response Text:');
      _printAll(response.toString());
    }
    logPrint('');
  }

  void _printKV(String key, Object? v) {
    logPrint('$key: $v');
  }

  void _printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }
}
