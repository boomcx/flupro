import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_manager.g.dart';

@riverpod
FutureOr<String?> getCache(Ref ref, String url) {
  return ref.watch(cacheProvider).getCache(url);
}

final cacheProvider = Provider<CacheManager>((ref) {
  return CacheManager();
});

class CacheManager {
  String _cacheDir = '';
  bool _initializing = false;
  bool _initialized = false;
  Completer? _initComplater;

  Future<void> _init() async {
    if (_initializing) return _initComplater!.future;
    _initComplater = Completer();
    _initializing = true;
    _initialized = false;
    final dir = (await getApplicationDocumentsDirectory()).path;
    _cacheDir = '$dir/app_cache/';
    final d = Directory(_cacheDir);
    if (!d.existsSync()) d.createSync();
    _initialized = true;
    _initializing = false;
    _initComplater!.complete();
    return _initComplater!.future;
  }

  Future<String?> getCache(String url) async {
    if (!_initialized) await _init();
    final savePath = getPath(url);
    final file = File(savePath);
    if (file.existsSync()) return savePath;
    final dio = Dio();
    try {
      await dio.download(url, savePath);
      return savePath;
    } catch (e) {
      return null;
    }
  }

  String getPath(String url) {
    final key = _getKey(url);
    final strs = url.split('.');
    String ext = '';
    if (strs.length >= 2) ext = strs.last;
    return '$_cacheDir$key.$ext';
  }

  String _getKey(String url) {
    return md5.convert(utf8.encode(url)).toString();
  }
}
