export 'params.dart';

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

/// https://pub.dev/packages/retrofit
@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  /// 退出登录
  @DELETE('/user/logout')
  Future<void> logout();

  @GET('https://api.thecatapi.com/v1/images/search')
  Future<List<ArticleModel>> getArticle(
    @Query('limit') int limit,
  );
  // Future<List<ArticleModel>> getArticle(@Queries() Map<String, dynamic> query);
}
