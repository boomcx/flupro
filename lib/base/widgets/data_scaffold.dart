import 'dart:async';

import 'package:flutter/material.dart';

import '../action_state.dart';
import 'empty_data_view.dart';

class DataScaffold extends StatelessWidget {
  const DataScaffold({
    Key? key,
    required this.isEmpty,
    required this.state,
    this.onRefresh,
    this.loadingWidget,
    required this.child,
    this.emptyWidget,
    this.emptyIcon,
    this.emptyTip,
    this.emptyAttachChild,
    this.onReload,
  }) : super(key: key);

  final bool Function() isEmpty;
  final ActionState state;
  final FutureOr Function()? onRefresh;
  final Widget? loadingWidget;

  final Widget child;
  final Widget? emptyWidget;
  final Widget? emptyIcon;
  final String? emptyTip;
  final Widget? emptyAttachChild;
  final VoidCallback? onReload;

  @override
  Widget build(BuildContext context) {
    final emptyWidget = this.emptyWidget ??
        DefaultEmptyDataView(
          emptyIcon: emptyIcon,
          emptyTip: emptyTip,
          onEmptyTap: onReload,
          emptyAttachChild: emptyAttachChild,
        );

    return state.when(
      initial: () => child,
      running: () =>
          isEmpty() ? (loadingWidget ?? const LoadingPlaceholder()) : child,
      success: () => isEmpty() ? emptyWidget : child,
      failure: (_) => isEmpty() ? emptyWidget : child,
    );

    // if (state is Running && isEmpty()) {
    //   return loadingWidget ?? const LoadingPlaceholder();
    // } else if (state is Failure) {
    //   if (onRefresh == null) return emptyWidget;
    //   return RefreshControl(
    //     // key: const ValueKey('empty'),
    //     onRefresh: onRefresh,
    //     childBuilder: (context, physics, constraints) {
    //       return SingleChildScrollView(
    //         physics: physics,
    //         child: SizedBox(
    //           height: constraints.maxHeight,
    //           child: emptyWidget,
    //         ),
    //       );
    //     },
    //   );
    // } else if (state is Success && isEmpty()) {
    //   if (onRefresh == null) return emptyWidget;
    //   return RefreshControl(
    //     // key: const ValueKey('empty'),
    //     onRefresh: onRefresh,
    //     childBuilder: (context, physics, constraints) {
    //       return SingleChildScrollView(
    //         physics: physics,
    //         child: SizedBox(
    //           height: constraints.maxHeight,
    //           child: emptyWidget,
    //         ),
    //       );
    //     },
    //   );
    // }
    // return child;
  }
}
