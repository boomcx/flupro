import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AutoDisposeRefExtension on AutoDisposeRef {
  // When invoked keeps your provider alive for [duration]
  void cacheFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, () => link.close());
    onDispose(() => timer.cancel());
  }
}
