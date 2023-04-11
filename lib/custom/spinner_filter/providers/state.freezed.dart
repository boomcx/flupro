// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoreFilterState {
  /// 是否单选模式
  /// 是否只有一个条件且只能单选 （判断显示底部按钮）(没有额外输入的筛选项-待定)
  /// `true` 点击按钮就要关闭弹框
  /// `false` 只有点击确认才关闭
  bool get singleConditionAndSingleSelect => throw _privateConstructorUsedError;

  /// 是否提交
  bool get isSubmit => throw _privateConstructorUsedError;

  /// 原始数据
  List<SpinnerFilterEntity> get items => throw _privateConstructorUsedError;

  /// 选中数据
  List<SpinnerFilterItem> get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoreFilterStateCopyWith<MoreFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoreFilterStateCopyWith<$Res> {
  factory $MoreFilterStateCopyWith(
          MoreFilterState value, $Res Function(MoreFilterState) then) =
      _$MoreFilterStateCopyWithImpl<$Res, MoreFilterState>;
  @useResult
  $Res call(
      {bool singleConditionAndSingleSelect,
      bool isSubmit,
      List<SpinnerFilterEntity> items,
      List<SpinnerFilterItem> selected});
}

/// @nodoc
class _$MoreFilterStateCopyWithImpl<$Res, $Val extends MoreFilterState>
    implements $MoreFilterStateCopyWith<$Res> {
  _$MoreFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? singleConditionAndSingleSelect = null,
    Object? isSubmit = null,
    Object? items = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      singleConditionAndSingleSelect: null == singleConditionAndSingleSelect
          ? _value.singleConditionAndSingleSelect
          : singleConditionAndSingleSelect // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmit: null == isSubmit
          ? _value.isSubmit
          : isSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SpinnerFilterEntity>,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as List<SpinnerFilterItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoreFilterStateCopyWith<$Res>
    implements $MoreFilterStateCopyWith<$Res> {
  factory _$$_MoreFilterStateCopyWith(
          _$_MoreFilterState value, $Res Function(_$_MoreFilterState) then) =
      __$$_MoreFilterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool singleConditionAndSingleSelect,
      bool isSubmit,
      List<SpinnerFilterEntity> items,
      List<SpinnerFilterItem> selected});
}

/// @nodoc
class __$$_MoreFilterStateCopyWithImpl<$Res>
    extends _$MoreFilterStateCopyWithImpl<$Res, _$_MoreFilterState>
    implements _$$_MoreFilterStateCopyWith<$Res> {
  __$$_MoreFilterStateCopyWithImpl(
      _$_MoreFilterState _value, $Res Function(_$_MoreFilterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? singleConditionAndSingleSelect = null,
    Object? isSubmit = null,
    Object? items = null,
    Object? selected = null,
  }) {
    return _then(_$_MoreFilterState(
      singleConditionAndSingleSelect: null == singleConditionAndSingleSelect
          ? _value.singleConditionAndSingleSelect
          : singleConditionAndSingleSelect // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmit: null == isSubmit
          ? _value.isSubmit
          : isSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SpinnerFilterEntity>,
      selected: null == selected
          ? _value._selected
          : selected // ignore: cast_nullable_to_non_nullable
              as List<SpinnerFilterItem>,
    ));
  }
}

/// @nodoc

class _$_MoreFilterState implements _MoreFilterState {
  const _$_MoreFilterState(
      {this.singleConditionAndSingleSelect = false,
      this.isSubmit = false,
      final List<SpinnerFilterEntity> items = const [],
      final List<SpinnerFilterItem> selected = const []})
      : _items = items,
        _selected = selected;

  /// 是否单选模式
  /// 是否只有一个条件且只能单选 （判断显示底部按钮）(没有额外输入的筛选项-待定)
  /// `true` 点击按钮就要关闭弹框
  /// `false` 只有点击确认才关闭
  @override
  @JsonKey()
  final bool singleConditionAndSingleSelect;

  /// 是否提交
  @override
  @JsonKey()
  final bool isSubmit;

  /// 原始数据
  final List<SpinnerFilterEntity> _items;

  /// 原始数据
  @override
  @JsonKey()
  List<SpinnerFilterEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// 选中数据
  final List<SpinnerFilterItem> _selected;

  /// 选中数据
  @override
  @JsonKey()
  List<SpinnerFilterItem> get selected {
    if (_selected is EqualUnmodifiableListView) return _selected;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selected);
  }

  @override
  String toString() {
    return 'MoreFilterState(singleConditionAndSingleSelect: $singleConditionAndSingleSelect, isSubmit: $isSubmit, items: $items, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoreFilterState &&
            (identical(other.singleConditionAndSingleSelect,
                    singleConditionAndSingleSelect) ||
                other.singleConditionAndSingleSelect ==
                    singleConditionAndSingleSelect) &&
            (identical(other.isSubmit, isSubmit) ||
                other.isSubmit == isSubmit) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._selected, _selected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      singleConditionAndSingleSelect,
      isSubmit,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_selected));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoreFilterStateCopyWith<_$_MoreFilterState> get copyWith =>
      __$$_MoreFilterStateCopyWithImpl<_$_MoreFilterState>(this, _$identity);
}

abstract class _MoreFilterState implements MoreFilterState {
  const factory _MoreFilterState(
      {final bool singleConditionAndSingleSelect,
      final bool isSubmit,
      final List<SpinnerFilterEntity> items,
      final List<SpinnerFilterItem> selected}) = _$_MoreFilterState;

  @override

  /// 是否单选模式
  /// 是否只有一个条件且只能单选 （判断显示底部按钮）(没有额外输入的筛选项-待定)
  /// `true` 点击按钮就要关闭弹框
  /// `false` 只有点击确认才关闭
  bool get singleConditionAndSingleSelect;
  @override

  /// 是否提交
  bool get isSubmit;
  @override

  /// 原始数据
  List<SpinnerFilterEntity> get items;
  @override

  /// 选中数据
  List<SpinnerFilterItem> get selected;
  @override
  @JsonKey(ignore: true)
  _$$_MoreFilterStateCopyWith<_$_MoreFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}
