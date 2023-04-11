import 'package:flupro/app.dart';
import 'package:flupro/base/widgets/app_bar.dart';
import 'package:flupro/custom/spinner/spinner.dart';

class DropView extends StatelessWidget {
  const DropView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AAppBar(title: '下拉弹框'),
      body: Column(
        children: [
          SpinnerBox(
            titles: const ['年份List', '年份Btn'],
            builder: (p0) => [
              // MoreFilter(
              //   data: [
              //     MoreFilterEntity(
              //         key: 'year',
              //         type: MoreContentType.checkList,
              //         items: [
              //           const MoreFilterItem(name: '不限', value: ''),
              //           ...List.generate(5, (index) {
              //             final year = (DateTime.now().year - index).toString();
              //             return MoreFilterItem(name: year, value: year);
              //           }),
              //         ])
              //   ],
              //   onSure: (result, name) {},
              // ).heightPart,
              // Consumer(
              //   builder: (context, ref, child) {
              //     final data = ref.watch(filterYearProvider);
              //     final selected = ref.watch(yearSelectedProvider);
              //     return MoreFilter(
              //       data: data,
              //       selected: selected,
              //       onSure: (result, name) {
              //         print(selected);
              //         p0.updateName(name);
              //       },
              //     );
              //   },
              // ).heightPart,
            ],
          ),
          SpinnerBox(
            titles: const ['title3', 'title4'],
            builder: (p0) => [
              Container(color: Colors.blue, height: 150).heightPart,
              Container(color: Colors.green, height: 300).heightPart,
            ],
          ),
        ],
      ),
    );
  }
}

// @riverpod
// List<MoreFilterEntity> filterYear(FilterYearRef ref) {
//   return [
//     MoreFilterEntity(key: 'year', title: '分组1', isRadio: false, items: [
//       const MoreFilterItem(name: '不限', value: ''),
//       ...List.generate(10, (index) {
//         final year = (DateTime.now().year - index).toString();
//         return MoreFilterItem(name: year, value: year);
//       }),
//     ])
//   ];
// }
 