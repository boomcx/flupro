export 'params.dart';

import 'dart:ffi';

import 'package:flupro/models.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../config.dart';
import 'data_interceptor.dart';

part 'api_client.g.dart';

@Riverpod(keepAlive: true)
ApiClient apiClient(ApiClientRef ref) => ApiClient(
      Dio(BaseOptions())
        ..interceptors.addAll([
          LogInterceptor(
            requestBody: true,
            responseBody: true,
          ),
          DataInterceptor(ref),
        ]),
      baseUrl:
          ref.watch(appConfigProvider.select((value) => value.serviceHost)),
    );

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  /// 退出登录
  @DELETE('/user/logout')
  Future<void> logout();

  @GET('http://jsonplaceholder.typicode.com/posts')
  Future<List<ArticleModel>> getArticle();
}
