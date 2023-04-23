import 'package:flupro/app.dart';
import 'package:flupro/base/widgets/app_bar.dart';
import 'package:flupro/custom/spinner/spinner.dart';
import 'package:flupro/custom/spinner_filter/spinner_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'drop_view.freezed.dart';
part 'drop_view.g.dart';

class DropView extends ConsumerWidget {
  const DropView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = PopupValueNotifier.titles(const ['单列表', '状态保留']);
    final name =
        ref.watch(dropViewControllerProvider.select((value) => value.name));

    return Scaffold(
      appBar: AAppBar(title: name),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(),
            // const _Title(name: 'children构建'),
            // SpinnerBox(
            //   controller: controller,
            //   children: [
            //     SpinnerFilter(
            //       data: [
            //         SpinnerFilterEntity(
            //             key: 'year',
            //             type: MoreContentType.checkList,
            //             items: [
            //               const SpinnerFilterItem(name: '不限', value: ''),
            //               ...List.generate(5, (index) {
            //                 final year =
            //                     (DateTime.now().year - index).toString();
            //                 return SpinnerFilterItem(name: year, value: year);
            //               }),
            //             ])
            //       ],
            //       onCompleted: (result, name, data) {
            //         controller.updateName(name);
            //       },
            //     ).heightPart,
            //     Consumer(
            //       builder: (context, ref, child) {
            //         final data = ref.watch(dropViewControllerProvider
            //             .select((value) => value.years));
            //         return SpinnerFilter(
            //           data: data,
            //           onCompleted: (result, name, data) {
            //             controller.updateName(name);
            //             ref
            //                 .read(dropViewControllerProvider.notifier)
            //                 .updateYears(data);
            //           },
            //         );
            //       },
            //     ).heightPart,
            //   ],
            // ),
            // const _GroupView('builder构建'),
            // const _GroupView(
            //   '并排其他组件',
            //   suffix: Text('尾部视图'),
            //   prefix: Text('前置视图'),
            // ),
            _GroupView(
              '并排输入框（焦点脱离）',
              prefix: Container(
                width: 200,
                color: Colors.white,
                padding: const EdgeInsets.all(5),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '点击输入框关闭筛选弹框',
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupView extends StatelessWidget {
  const _GroupView(
    this.name, {
    super.key,
    this.prefix,
    this.suffix,
  });

  final String name;

  /// 前置视图
  final Widget? prefix;

  /// 后置视图
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Title(name: name),
        _FilterView(
          suffix: suffix,
          prefix: prefix,
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      color: Colors.red[100],
      child: Text(
        name,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}

class _FilterView extends StatelessWidget {
  const _FilterView({
    super.key,
    this.prefix,
    this.suffix,
  });

  /// 前置视图
  final Widget? prefix;

  /// 后置视图
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return SpinnerBox.builder(
      prefix: prefix,
      suffix: suffix,
      titles: const ['单列表', '状态保留'],
      theme: defaultPinnerTheme.copyWith(outsideFocus: true),
      builder: (p0) => [
        SpinnerFilter(
          data: [
            SpinnerFilterEntity(
                key: 'year',
                type: MoreContentType.checkList,
                items: [
                  const SpinnerFilterItem(name: '不限', value: ''),
                  ...List.generate(5, (index) {
                    final year = (DateTime.now().year - index).toString();
                    return SpinnerFilterItem(name: year, value: year);
                  }),
                ])
          ],
          onCompleted: (result, name, data) {
            p0.updateName(name);
          },
        ).heightPart,
        Consumer(
          builder: (context, ref, child) {
            final data = ref.watch(
                dropViewControllerProvider.select((value) => value.years));
            return SpinnerFilter(
              data: data,
              onCompleted: (result, name, data) {
                p0.updateName(name);
                ref.read(dropViewControllerProvider.notifier).updateYears(data);
              },
            );
          },
        ).heightPart,
      ],
    );
  }
}

@freezed
class DropViewState with _$DropViewState {
  const factory DropViewState({
    @Default([]) List<SpinnerFilterEntity> years,
    @Default('下拉筛选框') String name,
  }) = _DropViewState;
  factory DropViewState.fromJson(Map<String, Object?> json) =>
      _$DropViewStateFromJson(json);
}

@riverpod
class DropViewController extends _$DropViewController {
  @override
  DropViewState build() {
    getYears();
    return const DropViewState();
  }

  getYears() async {
    await Future.delayed(const Duration(seconds: 3));
    updateYears(def);
  }

  updateYears(data) {
    state = state.copyWith(years: data);
  }
}

// @Riverpod(keepAlive: true)
// class YearFilter extends _$YearFilter {
//   @override
//   FutureOr<List<SpinnerFilterEntity>> build() async {
//     print('----------------------1');

//     await Future.delayed(Duration(seconds: 2));

//     print('----------------------2');

//     return [
//       SpinnerFilterEntity(
//           key: 'group1',
//           title: '分组1-多选',
//           isRadio: false,
//           items: [
//             const SpinnerFilterItem(name: '不限', value: ''),
//             ...List.generate(10, (index) {
//               return SpinnerFilterItem(name: '分组1-$index', value: index);
//             }),
//           ]),
//       SpinnerFilterEntity(key: 'group2', title: '分组2-单选', items: [
//         const SpinnerFilterItem(name: '不限', value: ''),
//         ...List.generate(10, (index) {
//           return SpinnerFilterItem(name: '分组2-$index', value: index);
//         }),
//       ]),
//       SpinnerFilterEntity(
//           desc: '9999999999999999999999999999999999999999999999',
//           key: 'group3',
//           title: '分组3-多选',
//           isRadio: false,
//           type: MoreContentType.checkList,
//           items: [
//             ...List.generate(3, (index) {
//               return SpinnerFilterItem(name: '分组3-$index', value: index);
//             }),
//           ]),
//       SpinnerFilterEntity(
//           key: 'group4',
//           title: '分组4-单选',
//           type: MoreContentType.checkList,
//           items: [
//             ...List.generate(3, (index) {
//               return SpinnerFilterItem(name: '分组4-$index', value: index);
//             }),
//           ]),
//     ];
//   }

//   updatev(data) {
//     state = AsyncValue.data(data);
//   }
// }

final def = [
  SpinnerFilterEntity(key: 'group1', title: '分组1-多选', isRadio: false, items: [
    const SpinnerFilterItem(name: '不限', value: '', isMutex: true),
    ...List.generate(10, (index) {
      return SpinnerFilterItem(name: '分组1-$index', value: index);
    }),
  ]),
  SpinnerFilterEntity(key: 'group2', title: '分组2-单选', items: [
    const SpinnerFilterItem(name: '不限', value: ''),
    ...List.generate(10, (index) {
      return SpinnerFilterItem(name: '分组2-$index', value: index);
    }),
  ]),
  SpinnerFilterEntity(
      desc: '9999999999999999999999999999999999999999999999',
      key: 'group3',
      title: '分组3-多选',
      isRadio: false,
      type: MoreContentType.checkList,
      items: [
        ...List.generate(3, (index) {
          return SpinnerFilterItem(name: '分组3-$index', value: index);
        }),
      ]),
  SpinnerFilterEntity(
      key: 'group4',
      title: '分组4-单选',
      type: MoreContentType.checkList,
      items: [
        ...List.generate(3, (index) {
          return SpinnerFilterItem(name: '分组4-$index', value: index);
        }),
      ]),
];
