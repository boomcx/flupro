part of '../spinner_filter.dart';

class _GroupContent extends StatelessWidget {
  const _GroupContent(this.group);

  final SpinnerFilterEntity group;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _GroupHeader(group: group),
            if (group.type == MoreContentType.checkList)
              _CheckListCnt(group: group),
            if (group.type == MoreContentType.groupBtn)
              _GroupBtnsCnt(group: group),
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
  const _CheckListCnt({
    required this.group,
  });
  final SpinnerFilterEntity group;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: group.items.length,
      itemBuilder: (context, index) {
        final item = group.items[index];
        return ButtonScope(
          // behavior: HitTestBehavior.translucent,
          onPressed: () {
            ref
                .read(spinnerFilterNotifierProvider.notifier)
                .buttonClick(group, item);
          },
          child: _CheckListItem(
            name: item.name,
            isSelect: item.selected,
            isMuti: !group.isRadio,
          ),
        );
      },
    );
  }
}

class _GroupBtnsCnt extends ConsumerWidget {
  const _GroupBtnsCnt({
    required this.group,
  });

  final SpinnerFilterEntity group;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = group.items;

    return Wrap(spacing: 10, runSpacing: 10, children: [
      ...List.generate(
        items.length,
        (i) {
          final item = items[i];
          return _Button(item.name, items[i].selected, onPressed: () {
            ref
                .read(spinnerFilterNotifierProvider.notifier)
                .buttonClick(group, item);
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
