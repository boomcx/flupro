import 'dart:convert';

import 'package:flupro/app.dart';
import 'package:flupro/models.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../network/api_client.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<AppToken?> build() {
    final box = Hive.box('app');
    final tokenString = box.get('token');
    if (tokenString == null) return null;
    final token = AppToken.fromJson(jsonDecode(tokenString));
    logger.i('Authorization: ${token.token}');
    return token;
  }

  Future login() {
    return Future.value();
  }

  Future<void> logout() async {
    try {
      await ref.read(apiClientProvider).logout();
    } catch (error) {
      logger.e(error);
    }
    final box = Hive.box('app');
    box.delete('token');
    state = const AsyncValue.data(null);
  }
}

@Riverpod(keepAlive: true)
bool isLogged(IsLoggedRef ref) {
  return ref
      .watch(authNotifierProvider.select((value) => value.valueOrNull != null));
}
