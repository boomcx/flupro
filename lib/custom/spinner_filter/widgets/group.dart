part of '../spinner_filter.dart';

class _GroupContent extends StatelessWidget {
  const _GroupContent(this.group, this.index);

  final SpinnerFilterEntity group;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _GroupHeader(group: group),
            if (group.type == MoreContentType.checkList)
              ProviderScope(
                overrides: [
                  spinnerGroupProvider.overrideWithValue(Tuple2(group, index)),
                ],
                child: const _CheckListCnt(),
              ),
            if (group.type == MoreContentType.groupBtn)
              ProviderScope(
                overrides: [
                  spinnerGroupProvider.overrideWithValue(Tuple2(group, index)),
                ],
                child: const _GroupBtnsCnt(),
              )
          ],
        ));
  }
}

class _GroupHeader extends StatelessWidget {
  const _GroupHeader({
    required this.group,
  });

  final SpinnerFilterEntity group;

  @override
  Widget build(BuildContext context) {
    if (group.title.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Wrap(
        spacing: 8,
        children: [
          Text(
            group.title,
            style: TextStyle(color: context.appColors.text4, fontSize: 12),
          ),
          if (group.desc.isNotEmpty) _ExplainIcon(desc: group.desc),
          if (group.isVipIcon)
            Assets.images.searchIconVip
                .image(width: 32, height: 16, fit: BoxFit.contain)
        ],
      ),
    );
  }
}

class _CheckListCnt extends ConsumerWidget {
  const _CheckListCnt();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tuple = ref.watch(spinnerGroupProvider);
    final items = tuple.item1.items;

    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ButtonScope(
          // behavior: HitTestBehavior.translucent,
          onPressed: () {
            ref
                .read(spinnerFilterNotifierProvider.notifier)
                .itemOnClick(tuple, index);
          },
          child: _CheckListItem(
            name: item.name,
            isSelect: item.selected,
            isMuti: !tuple.item1.isRadio,
          ),
        );
      },
    );
  }
}

class _GroupBtnsCnt extends ConsumerWidget {
  const _GroupBtnsCnt();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tuple = ref.watch(spinnerGroupProvider);
    final items = tuple.item1.items;

    return Wrap(spacing: 10, runSpacing: 10, children: [
      ...List.generate(
        items.length,
        (index) {
          final item = items[index];
          return _Button(item.name, item.selected, onPressed: () {
            ref
                .read(spinnerFilterNotifierProvider.notifier)
                .itemOnClick(tuple, index);
          });
        },
      ),
      // 时间选择器
      // if (group.extra == MExtraType.timepicker)
      // TimePickerBtn(
      //   data: group.extraData ?? {},
      //   minHolder: group.extraHolder.first,
      //   maxHolder: group.extraHolder.last,
      //   onChanged: (min, max) {
      //     /// 清空已选
      //     for (var e in items) {
      //       e.selected = false;
      //     }
      //     // 保存临时数据
      //     group.extraData = {'start': min, 'end': max};
      //     controller.update([group.key]);
      //   },
      // ),
    ]);
  }
}
