import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';

import 'package:simple_auth/core/app_prefs.dart';
import 'package:simple_auth/core/constants.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  final AppPreferences _appPreferences;
  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    int _timeout = 60 * 1000; // 1 minute

    String? token =await _appPreferences.getToken();

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: token??'',
      DEFAULT_LANGUAGE: "en"
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: _timeout,
      receiveTimeout: _timeout,
      headers: headers,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        request: true,
      ));
    }
    return dio;
  }
}
