// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) {
  return _ArticleModel.fromJson(json);
}

/// @nodoc
mixin _$ArticleModel {
  @JsonAlwaysNum()
  num get width => throw _privateConstructorUsedError;
  @JsonAlwaysNum()
  num get height => throw _privateConstructorUsedError;
  @JsonAlwaysString()
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleModelCopyWith<ArticleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleModelCopyWith<$Res> {
  factory $ArticleModelCopyWith(
          ArticleModel value, $Res Function(ArticleModel) then) =
      _$ArticleModelCopyWithImpl<$Res, ArticleModel>;
  @useResult
  $Res call(
      {@JsonAlwaysNum() num width,
      @JsonAlwaysNum() num height,
      @JsonAlwaysString() String id,
      String url});
}

/// @nodoc
class _$ArticleModelCopyWithImpl<$Res, $Val extends ArticleModel>
    implements $ArticleModelCopyWith<$Res> {
  _$ArticleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as num,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as num,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticleModelCopyWith<$Res>
    implements $ArticleModelCopyWith<$Res> {
  factory _$$_ArticleModelCopyWith(
          _$_ArticleModel value, $Res Function(_$_ArticleModel) then) =
      __$$_ArticleModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonAlwaysNum() num width,
      @JsonAlwaysNum() num height,
      @JsonAlwaysString() String id,
      String url});
}

/// @nodoc
class __$$_ArticleModelCopyWithImpl<$Res>
    extends _$ArticleModelCopyWithImpl<$Res, _$_ArticleModel>
    implements _$$_ArticleModelCopyWith<$Res> {
  __$$_ArticleModelCopyWithImpl(
      _$_ArticleModel _value, $Res Function(_$_ArticleModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_$_ArticleModel(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as num,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as num,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArticleModel implements _ArticleModel {
  const _$_ArticleModel(
      {@JsonAlwaysNum() this.width = 0,
      @JsonAlwaysNum() this.height = 0,
      @JsonAlwaysString() this.id = '',
      this.url = ''});

  factory _$_ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$$_ArticleModelFromJson(json);

  @override
  @JsonKey()
  @JsonAlwaysNum()
  final num width;
  @override
  @JsonKey()
  @JsonAlwaysNum()
  final num height;
  @override
  @JsonKey()
  @JsonAlwaysString()
  final String id;
  @override
  @JsonKey()
  final String url;

  @override
  String toString() {
    return 'ArticleModel(width: $width, height: $height, id: $id, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleModel &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, width, height, id, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleModelCopyWith<_$_ArticleModel> get copyWith =>
      __$$_ArticleModelCopyWithImpl<_$_ArticleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArticleModelToJson(
      this,
    );
  }
}

abstract class _ArticleModel implements ArticleModel {
  const factory _ArticleModel(
      {@JsonAlwaysNum() final num width,
      @JsonAlwaysNum() final num height,
      @JsonAlwaysString() final String id,
      final String url}) = _$_ArticleModel;

  factory _ArticleModel.fromJson(Map<String, dynamic> json) =
      _$_ArticleModel.fromJson;

  @override
  @JsonAlwaysNum()
  num get width;
  @override
  @JsonAlwaysNum()
  num get height;
  @override
  @JsonAlwaysString()
  String get id;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleModelCopyWith<_$_ArticleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
