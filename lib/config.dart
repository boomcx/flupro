import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config.g.dart';

@Riverpod(keepAlive: true)
AppConfig appConfig(AppConfigRef ref) => throw UnimplementedError();

class AppConfig {
  /// 接口域名
  final String serviceHost;

  /// 电脑端地址
  final String pcService;

  AppConfig({
    required this.serviceHost,
    required this.pcService,
  });
}

final testConfig = AppConfig(
  serviceHost: 'http://test.deepinfo.cn:90/api',
  pcService:
      'http://user-site-pc-1309875532.cos-website.ap-shanghai.myqcloud.com',
);

final betaConfig = AppConfig(
  serviceHost: 'http://www.tapehour.com/api',
  pcService: 'http://www.tapehour.com ',
);
