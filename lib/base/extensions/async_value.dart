import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/format_utils.dart';
import '../widgets/toast.dart';

extension AsyncValueToast on AsyncValue {
  void showLoadingToast() {
    when(
      loading: () => Toast.showLoading(),
      data: (value) => Toast.hideLoading(),
      error: (error, stackTrace) => Toast.hideLoading(),
    );
  }

  void showToastOnError() {
    whenOrNull(
      error: (error, stackTrace) => Toast.showError(formatError(error)),
    );
  }
}
