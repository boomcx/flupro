import 'package:freezed_annotation/freezed_annotation.dart';
part 'entity.freezed.dart';
part 'entity.g.dart';

@freezed
class SpinnerFilterEntity with _$SpinnerFilterEntity {
  const factory SpinnerFilterEntity({
    /// 服务器字段
    required String key,

    /// 是否单选
    @Default(true) bool isRadio,

    /// 标题，空不显示
    @Default('') String title,

    /// 额外输入类型
    MExtraType? extra,

    /// 每组内容的显示风格
    @Default(MoreContentType.groupBtn) MoreContentType type,

    /// 额外输入,占位显示文字
    @Default([]) List<String> extraHolder,

    /// 额外输入类型,数据存储，与`MoreFilterItem-value `一致
    dynamic extraData,

    /// 问号描述，点击显示内容
    @Default('') String desc,

    /// 是否 vip 逻辑处理 待补充
    @Default(false) bool isVip,

    /// 是否显示 vip 按钮
    @Default(false) bool isVipIcon,

    /// 选项集
    @Default([]) List<SpinnerFilterItem> items,
  }) = _MoreFilterEntity;
  factory SpinnerFilterEntity.fromJson(Map<String, Object?> json) =>
      _$SpinnerFilterEntityFromJson(json);
}

@freezed
class SpinnerFilterItem with _$SpinnerFilterItem {
  const factory SpinnerFilterItem({
    /// 显示名称
    required String name,

    /// 选中项的数据值 (原样输入输出)
    dynamic value,

    /// 是否选中
    @Default(false) bool selected,
  }) = _MoreFilterItem;
  factory SpinnerFilterItem.fromJson(Map<String, Object?> json) =>
      _$SpinnerFilterItemFromJson(json);
}

/// 额外输入的类型
enum MExtraType {
  /// 选择时间区间框
  timepicker,

  /// ... other
}

/// 内容显示类型
enum MoreContentType {
  /// 按钮形式
  groupBtn,

  /// 列表形式
  checkList,
}
