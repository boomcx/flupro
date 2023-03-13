import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app.dart';
import '../events/events.dart';
import '../providers/auth_provider.dart';
import '../providers/event_provider.dart';

class DataInterceptor extends Interceptor {
  final Ref _ref;

  DataInterceptor(Ref ref) : _ref = ref;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _ref.read(authNotifierProvider).valueOrNull;
    if (token != null && token.token.isNotEmpty) {
      options.headers['Authorization'] = token.token;
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
//     logger.d('''
// ================================= 请求数据 =================================
//     method  = ${response.requestOptions.method.toString()}
//     headers = ${response.requestOptions.headers.toString()}
//     query   = ${response.requestOptions.queryParameters.toString()}
//     body    = ${response.requestOptions.data.toString()}
// ''');
//     logger.d('''
// ================================= 响应数据 =================================
//     ${response.data}
// ''');

    Map dataMap;
    if (response.data is Map) {
      dataMap = response.data;
    } else if (response.data is String) {
      dataMap = jsonDecode(response.data);
    } else {
      dataMap = {'code': 200, 'data': response.data, 'message': 'success'};
    }

    if (dataMap['code'] != 200) {
      if (dataMap['code'] == 402 || dataMap['code'] == 401) {
        _ref.read(eventBusProvider).fire(AppNeedToLogin());
      }
      handler.reject(
        DioError(
          requestOptions: response.requestOptions,
          error: dataMap['message'],
        ),
        true,
      );
      return;
    }
    response.data = dataMap['data'];
    handler.next(response);
  }
}
