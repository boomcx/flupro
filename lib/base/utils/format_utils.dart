import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import './error.dart';

String? formatError(dynamic e) {
  String error = '';
  if (e is String) return e;
  if (e is DioError) {
    return e.message;
  }
  if (e is AppError) {
    if (e.code == AppErrorCode.mediaDecodingFailed) {
      return "转码失败";
    }
  }
  if (e is PlatformException) {
    if (e.code == 'CosXmlServiceException') {
      return '上传文件出错';
    }
  }
  return error.isEmpty ? '未知错误' : error;
}

// String getVipName(BuildContext context, UserType type) {
//   switch (type) {
//     case UserType.general:
//       return S.of(context).vip1;
//   }
// }

num toNum(String value) {
  return num.tryParse(value) ?? 0;
}

bool isNullOrEmpty(String? value) {
  if (value == null) return true;
  return value.isEmpty;
}

/// 将数字转成字符串
String formatDecimalNumber(num value, {int digits = 2}) {
  String d = '';
  for (int i = 0; i < digits; i++) {
    d += '#';
  }
  // 后台计算方式，小数不四舍五入，直接舍弃多余小数
  var valueString = value.toString();
  final index = valueString.indexOf('.');
  if (index != -1) {
    final end = min(index + 1 + digits, valueString.length);
    valueString = valueString.substring(0, end);
  }
  final format = NumberFormat('0.$d');
  return format.format(toNum(valueString));
}

String formatDate(DateTime date, String formatStr) {
  final format = DateFormat(formatStr);
  return format.format(date);
}

TextEditingValue valueToLastPosition(String value) {
  return TextEditingValue(
    text: value,
    selection: TextSelection.fromPosition(
      TextPosition(
        affinity: TextAffinity.downstream,
        offset: value.length,
      ),
    ),
  );
}
