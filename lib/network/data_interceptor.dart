import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    Map dataMap;
    if (response.data is Map) {
      dataMap = response.data;
    } else {
      dataMap = jsonDecode(response.data);
    }
    if (dataMap['error'] != 0) {
      if (dataMap['error'] == 402 || dataMap['error'] == 401) {
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
