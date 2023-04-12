// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drop_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DropViewState _$DropViewStateFromJson(Map<String, dynamic> json) {
  return _DropViewState.fromJson(json);
}

/// @nodoc
mixin _$DropViewState {
  List<SpinnerFilterEntity> get years => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DropViewStateCopyWith<DropViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DropViewStateCopyWith<$Res> {
  factory $DropViewStateCopyWith(
          DropViewState value, $Res Function(DropViewState) then) =
      _$DropViewStateCopyWithImpl<$Res, DropViewState>;
  @useResult
  $Res call({List<SpinnerFilterEntity> years, String name});
}

/// @nodoc
class _$DropViewStateCopyWithImpl<$Res, $Val extends DropViewState>
    implements $DropViewStateCopyWith<$Res> {
  _$DropViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? years = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      years: null == years
          ? _value.years
          : years // ignore: cast_nullable_to_non_nullable
              as List<SpinnerFilterEntity>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DropViewStateCopyWith<$Res>
    implements $DropViewStateCopyWith<$Res> {
  factory _$$_DropViewStateCopyWith(
          _$_DropViewState value, $Res Function(_$_DropViewState) then) =
      __$$_DropViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SpinnerFilterEntity> years, String name});
}

/// @nodoc
class __$$_DropViewStateCopyWithImpl<$Res>
    extends _$DropViewStateCopyWithImpl<$Res, _$_DropViewState>
    implements _$$_DropViewStateCopyWith<$Res> {
  __$$_DropViewStateCopyWithImpl(
      _$_DropViewState _value, $Res Function(_$_DropViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? years = null,
    Object? name = null,
  }) {
    return _then(_$_DropViewState(
      years: null == years
          ? _value._years
          : years // ignore: cast_nullable_to_non_nullable
              as List<SpinnerFilterEntity>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DropViewState implements _DropViewState {
  const _$_DropViewState(
      {final List<SpinnerFilterEntity> years = const [], this.name = '下拉筛选框'})
      : _years = years;

  factory _$_DropViewState.fromJson(Map<String, dynamic> json) =>
      _$$_DropViewStateFromJson(json);

  final List<SpinnerFilterEntity> _years;
  @override
  @JsonKey()
  List<SpinnerFilterEntity> get years {
    if (_years is EqualUnmodifiableListView) return _years;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_years);
  }

  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'DropViewState(years: $years, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DropViewState &&
            const DeepCollectionEquality().equals(other._years, _years) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_years), name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DropViewStateCopyWith<_$_DropViewState> get copyWith =>
      __$$_DropViewStateCopyWithImpl<_$_DropViewState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DropViewStateToJson(
      this,
    );
  }
}

abstract class _DropViewState implements DropViewState {
  const factory _DropViewState(
      {final List<SpinnerFilterEntity> years,
      final String name}) = _$_DropViewState;

  factory _DropViewState.fromJson(Map<String, dynamic> json) =
      _$_DropViewState.fromJson;

  @override
  List<SpinnerFilterEntity> get years;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_DropViewStateCopyWith<_$_DropViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
