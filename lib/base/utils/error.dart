class AppError implements Exception {
  final int code;

  AppError(this.code);
}

class AppErrorCode {
  /// 视频或音频转码失败
  static const mediaDecodingFailed = 100;

  /// 视频或音频处理失败
  static const mediaProcessFailed = 101;
}
