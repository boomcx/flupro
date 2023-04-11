import 'package:freezed_annotation/freezed_annotation.dart';

import 'entity.dart';
part 'state.freezed.dart';

@freezed
class MoreFilterState with _$MoreFilterState {
  const factory MoreFilterState({
    /// 是否单选模式
    /// 是否只有一个条件且只能单选 （判断显示底部按钮）(没有额外输入的筛选项-待定)
    /// `true` 点击按钮就要关闭弹框
    /// `false` 只有点击确认才关闭
    @Default(false) bool singleConditionAndSingleSelect,

    /// 是否提交
    @Default(false) bool isSubmit,

    /// 原始数据
    @Default([]) List<SpinnerFilterEntity> items,

    /// 选中数据
    @Default([]) List<SpinnerFilterItem> selected,
  }) = _MoreFilterState;
}
