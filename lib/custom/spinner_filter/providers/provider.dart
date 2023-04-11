import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'entity.dart';
import 'state.dart';
import 'package:tuple/tuple.dart';

part 'provider.g.dart';

// final moreFilterGroupProvider = StateProvider<MoreFilterEntity>((ref) {
//   throw UnimplementedError();
// });

@riverpod
class SpinnerFilterNotifier extends _$SpinnerFilterNotifier {
  @override
  MoreFilterState build() {
    return const MoreFilterState();
  }

  void init(List<SpinnerFilterEntity> list, List<SpinnerFilterItem> selected) {
    final singleCondition = list.length == 1;
    final singleSelect = list.first.isRadio == true;
    // final notExtra = items.first['extra'] == null;
    state = state.copyWith(
      singleConditionAndSingleSelect: singleCondition && singleSelect,
      items: list,
      selected: selected,
    );
  }

  void updateSubmit(bool data) {
    state = state.copyWith(isSubmit: data);
  }

  /// 完成筛选
  void completed() {
    updateSubmit(true);
  }

  /// 重置
  void reset() {
    state = state.copyWith(
      selected: [],
    );
  }

  /// 获取选择的结果
  Tuple2<Map<String, List<dynamic>>, String> getResult() {
    final items = state.items;
    final reslut = <String, List>{};
    final reslutNames = [];

    for (var group in items) {
      final key = group.key;
      final resGroup = {key: []};

      /// 额外选择输入的情况
      if (group.extra != null) {
        final isNotNull = group.extraData != null;
        if (isNotNull) {
          resGroup[key]!.add(group.extraData);
        }
      }

      final list = group.items;
      for (var item in list) {
        // if (item.selected) {
        //   resGroup[key]!.add(item.value);
        //   reslutNames.add(item.name);
        // }
      }
      // 加入集合
      reslut.addAll(resGroup);
    }

    return Tuple2(reslut, reslutNames.join('/'));
  }

  /// 数据组装
  // void setResult(Map source, List target) {
  //   // 如果需要填装的参数值只有一个，直接使用该字段值填装数组
  //   if (keys.length == 1) {
  //     target.add(source[keys.first]);
  //   } else {
  //     // 如果需要填装的参数值有多个，使用Map填装数组
  //     final temp = {};
  //     for (var key in keys) {
  //       temp[key] = source[key];
  //     }
  //     target.add(temp);
  //   }
  // }

  /// 点击按钮选项
  void buttonClick(
    SpinnerFilterEntity group,
    SpinnerFilterItem item,
  ) {
    final single = group.isRadio;
    var items = List.of(state.selected);
    if (single) {
      items.clear();
    }

    final idx = items.indexWhere((element) => element.name == item.name);
    if (idx > -1) {
      items.removeAt(idx);
    } else {
      items.add(item);
    }

    state = state.copyWith(selected: items);

    // 点击按钮的时候 清空其他选择项
    if (group.extra != null) {
      group.extraData == null;
    }

    // state = state.copyWith(items: )

    if (state.singleConditionAndSingleSelect) {
      // 完成条件
      completed();
    }
  }
}

extension MFMapExt on Map {
  /// 将数组类型的value 修改为字符串类型
  Map<String, String> get listValue2Str => map(
        (key, value) =>
            MapEntry(key, value is List ? value.join(',') : '$value'),
      );
}
