import 'package:flupro/base/widgets/primary_button.dart';
import 'package:flupro/support_files/assets.gen.dart';
import 'package:flupro/support_files/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tuple/tuple.dart';

export './providers/entity.dart';
export './providers/provider.dart';

import '../../base/widgets/popup_message.dart';
import 'spinner_filter.dart';

part './widgets/buttons.dart';
part './widgets/group.dart';
part './widgets/check_list_item.dart';
part './widgets/explain_icon.dart';

class SpinnerFilter extends ConsumerStatefulWidget {
  const SpinnerFilter({
    super.key,
    required this.data,
    required this.onCompleted,
  });

  final List<SpinnerFilterEntity> data;
  final Function(
          Map<String, List> result, String name, List<SpinnerFilterEntity> data)
      onCompleted;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SpinnerFilterState();
}

class _SpinnerFilterState extends ConsumerState<SpinnerFilter> {
  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   if (widget.data.isNotEmpty) {
    //     ref.read(spinnerFilterNotifierProvider.notifier).init(widget.data);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(spinnerFilterNotifierProvider.select((value) => value.increment),
        (previous, next) {
      if (previous != next) {
        final result =
            ref.read(spinnerFilterNotifierProvider.notifier).getResult();
        final data = ref.read(spinnerFilterNotifierProvider.notifier).items;
        // 筛选出全部选中的结果
        widget.onCompleted(result.item1, result.item2, data);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.data.isNotEmpty) {
        ref.read(spinnerFilterNotifierProvider.notifier).init(widget.data);
      }
    });

    if (widget.data.isEmpty) {
      return Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.all(8),
        child: const CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
    }

    return Material(
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          children: const [
            SingleChildScrollView(
              child: _MoreFilterContent(),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: _BotButtons(),
            )
          ],
        ),
      ),
    );
  }
}

class _MoreFilterContent extends ConsumerWidget {
  const _MoreFilterContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items =
        ref.watch(spinnerFilterNotifierProvider.select((value) => value.items));
    final single = ref.watch(spinnerFilterNotifierProvider
        .select((value) => value.singleConditionAndSingleSelect));

    //  Padding(
    //   padding: EdgeInsets.only(
    //     bottom: single ? 0 : kBotBtnHeight + 10,
    //     top: 16,
    //   ),
    //   child: const _MoreFilterContent(),
    // ),
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 12,
        bottom: single ? 0 : kBotBtnHeight + 10,
      ),
      itemBuilder: (context, index) {
        return _GroupContent(items[index], index);
      },
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Divider(height: 1, color: Color(0xffEEEEEE)),
      ),
      itemCount: items.length,
    );
  }
}

class _BotButtons extends ConsumerWidget {
  const _BotButtons();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final single = ref.watch(spinnerFilterNotifierProvider
        .select((value) => value.singleConditionAndSingleSelect));
    if (single) {
      return const SizedBox();
    }
    return Container(
      height: kBotBtnHeight,
      padding: const EdgeInsets.only(top: kBotBtnHeight - 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 1, color: Color(0xfff5f5f5)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _PopBotButton(
            isReset: true,
            name: '重置',
            onPressed: () {
              ref.read(spinnerFilterNotifierProvider.notifier).reset();
            },
          ),
          _PopBotButton(
            onPressed: () {
              ref.read(spinnerFilterNotifierProvider.notifier).completed();
            },
          ),
        ],
      ),
    );
  }
}
