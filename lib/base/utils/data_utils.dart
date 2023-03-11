import 'package:flutter/material.dart';

String formatDuration(Duration position) {
  final ms = position.inMilliseconds;

  int seconds = ms ~/ 1000;
  final int hours = seconds ~/ 3600;
  seconds = seconds % 3600;
  final minutes = seconds ~/ 60;
  seconds = seconds % 60;

  final hoursString = hours >= 10
      ? '$hours'
      : hours == 0
          ? '00'
          : '0$hours';

  final minutesString = minutes >= 10
      ? '$minutes'
      : minutes == 0
          ? '00'
          : '0$minutes';

  final secondsString = seconds >= 10
      ? '$seconds'
      : seconds == 0
          ? '00'
          : '0$seconds';

  final formattedTime =
      '${hoursString == '00' ? '' : '$hoursString:'}$minutesString:$secondsString';

  return formattedTime;
}

/// 秒转时分秒
String formatTime(int seconds) {
  final h = seconds ~/ 3600;
  final s = seconds % 3600 ~/ 60;
  final m = seconds % 60;
  if (h > 0) {
    return '${h < 10 ? '0$h' : h}:${s < 10 ? '0$s' : s}:${m < 10 ? '0$m' : m}';
  }
  return '${s < 10 ? '0$s' : s}:${m < 10 ? '0$m' : m}';
}

String formatCounter(BuildContext context, int count) {
  if (count >= 1000000) {
    return '${(count / 10000).ceil()}百万';
  } else if (count >= 10000) {
    return '${(count / 10000).ceil()}万';
  } else if (count >= 1000) {
    return '${(count / 1000).ceil()}千';
  }
  return '$count';
}
