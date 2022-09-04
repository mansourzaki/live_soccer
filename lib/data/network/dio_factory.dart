import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:live_soccer/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String KEY_HEADER = 'x-apisports-key';

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    int _timeOut = 60 * 1000;
    Map<String, dynamic> headers = {KEY_HEADER: Constants.apiKey};
    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: headers,
        sendTimeout: _timeOut,
        receiveTimeout: _timeOut);

    if(!kReleaseMode){
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true
      ));
    }
    return dio;
  }
}
