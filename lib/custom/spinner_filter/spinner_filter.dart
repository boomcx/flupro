import 'package:flupro/support_files/assets.gen.dart';
import 'package:flupro/support_files/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

export './providers/entity.dart';
export './providers/provider.dart';

import '../popup_message.dart';
import 'spinner_filter.dart';

part './widgets/buttons.dart';
part './widgets/group.dart';
part './widgets/check_list_item.dart';
part './widgets/explain_icon.dart';

class SpinnerFilter extends ConsumerStatefulWidget {
  const SpinnerFilter({
    super.key,
    required this.data,
    required this.onSure,
  });

  final List<SpinnerFilterEntity> data;
  final Function(Map<String, List> result, String name) onSure;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SpinnerFilterState();
}

class _SpinnerFilterState extends ConsumerState<SpinnerFilter> {
  @override
  void initState() {
    super.initState();

    // ever(_controller.isOnSure, (value) {
    //   if (value) {
    //     _controller.isOnSure.value = false;

    //     final result = _controller.getResult();
    //     // 筛选出全部选中的结果
    //     widget.onSure(result.first, result.last);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(spinnerFilterNotifierProvider.select((value) => value.isSubmit),
        (previous, next) {
      if (next) {
        final result =
            ref.read(spinnerFilterNotifierProvider.notifier).getResult();
        // 筛选出全部选中的结果
        widget.onSure(result.item1, result.item2);
      }
    });

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _MoreFilterContent(),
            _BotButtons(),
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

    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemBuilder: (context, index) {
        return _GroupContent(items[index]);
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
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Divider(height: 1, color: Color(0xffEEEEEE)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _PopBotButton(
              isReset: true,
              name: '重置',
              onPressed: () {
                ref.watch(spinnerFilterNotifierProvider.notifier).reset();
              },
            ),
            _PopBotButton(
              onPressed: () {
                ref.watch(spinnerFilterNotifierProvider.notifier).completed();
              },
            ),
          ],
        )
      ],
    );
  }
}
