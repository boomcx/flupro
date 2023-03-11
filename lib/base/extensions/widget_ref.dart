import 'package:hooks_riverpod/hooks_riverpod.dart';

extension WidgetRefExt on WidgetRef {
  void keepAlive<T>(ProviderListenable<T> provider) {
    listen(provider, (previous, next) {});
  }
}
