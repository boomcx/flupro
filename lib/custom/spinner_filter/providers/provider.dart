// // ignore_for_file: depend_on_referenced_packages

// import 'package:riverpod_annotation/riverpod_annotation.dart';

// import 'entity.dart';
// import 'state.dart';
// import 'package:tuple/tuple.dart';

// part 'provider.g.dart';

// const double kBotBtnHeight = 56.0;

// // final moreFilterGroupProvider = StateProvider<MoreFilterEntity>((ref) {
// //   throw UnimplementedError();
// // });

// @riverpod
// Tuple2<SpinnerFilterEntity, int> spinnerGroup(SpinnerGroupRef ref) {
//   throw UnimplementedError();
// }

// @riverpod
// class SpinnerFilterNotifier extends _$SpinnerFilterNotifier {
//   @override
//   SpinnerFilterState build() {
//     return const SpinnerFilterState();
//   }

//   /// 当前数据
//   List<SpinnerFilterEntity> get items => state.items;

//   /// 初始化
//   void init(List<SpinnerFilterEntity> data) {
//     final singleCondition = data.length == 1;
//     final singleSelect = data.first.isRadio == true;
//     // final notExtra = items.first['extra'] == null;
//     state = state.copyWith(
//       singleConditionAndSingleSelect: singleCondition && singleSelect,
//       items: data,
//       isInit: true,
//     );
//   }

//   // void updateSubmit(bool data) {
//   //   state = state.copyWith(increment: increment);
//   // }

//   /// 完成筛选
//   void completed() {
//     state = state.copyWith(increment: state.increment + 1);
//   }

//   /// 重置
//   void reset() {
//     var groups = List.of(state.items);
//     for (var i = 0; i < groups.length; i++) {
//       var tempGroup = groups[i];
//       // 清空其他自定义项
//       if (tempGroup.extra != null) {
//         tempGroup = tempGroup.copyWith(extraData: null);
//       }
//       // 修改按钮选中状态
//       var items = List.of(tempGroup.items);
//       for (var k = 0; k < items.length; k++) {
//         items[k] = items[k].copyWith(selected: false);
//       }

//       groups[i] = tempGroup.copyWith(items: items);
//     }

//     state = state.copyWith(items: groups);
//   }

//   /// 获取选择的结果
//   Tuple2<Map<String, List<dynamic>>, String> getResult() {
//     final items = state.items;
//     final reslut = <String, List>{};
//     final reslutNames = [];

//     for (var group in items) {
//       final key = group.key;
//       final resGroup = {key: []};

//       /// 额外选择输入的情况
//       if (group.extra != null) {
//         final isNotNull = group.extraData != null;
//         if (isNotNull) {
//           resGroup[key]!.add(group.extraData);
//         }
//       }

//       final list = group.items;
//       for (var item in list) {
//         if (item.selected) {
//           resGroup[key]!.add(item.value);
//           reslutNames.add(item.name);
//         }
//       }
//       reslut.addAll(resGroup);
//     }

//     return Tuple2(reslut, reslutNames.join('/'));
//   }

//   /// 点击按钮选项
//   /// `tuple` 包含当前点击的分组数据 和 分组下标
//   /// `index` 按钮下标
//   void itemOnClick(Tuple2<SpinnerFilterEntity, int> tuple, int index) {
//     final group = tuple.item1;

//     final single = group.isRadio;
//     var groups = List.of(state.items);
//     for (var i = 0; i < groups.length; i++) {
//       var tempGroup = groups[i];
//       // 当前操做的数据组
//       if (i == tuple.item2) {
//         // 点击按钮的时候 清空其他自定义项
//         if (tempGroup.extra != null) {
//           tempGroup = tempGroup.copyWith(extraData: null);
//         }

//         // 修改按钮选中状态
//         var items = List.of(tempGroup.items);
//         for (var k = 0; k < items.length; k++) {
//           var tempItem = items[k];
//           // 单选
//           if (single) {
//             items[k] = tempItem.copyWith(selected: false);
//           } else {
//             if (items[index].isMutex) {
//               items[k] = tempItem.copyWith(selected: false);
//             } else {
//               if (tempItem.isMutex) {
//                 items[k] = tempItem.copyWith(selected: false);
//               }
//             }
//           }

//           // 多选
//           if (index == k) {
//             items[k] = tempItem.copyWith(selected: !tempItem.selected);
//           }
//         }
//         groups[i] = tempGroup.copyWith(items: items);
//       }
//     }

//     state = state.copyWith(items: groups);

//     if (state.singleConditionAndSingleSelect) {
//       // 完成条件
//       completed();
//     }
//   }
// }

// extension MFMapExt on Map {
//   /// 将数组类型的value 修改为字符串类型
//   Map<String, String> get listValue2Str => map(
//         (key, value) =>
//             MapEntry(key, value is List ? value.join(',') : '$value'),
//       );
// }
