// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticleModel _$$_ArticleModelFromJson(Map<String, dynamic> json) =>
    _$_ArticleModel(
      width: json['width'] == null
          ? 0
          : const JsonAlwaysNum().fromJson(json['width']),
      height: json['height'] == null
          ? 0
          : const JsonAlwaysNum().fromJson(json['height']),
      id: json['id'] == null
          ? ''
          : const JsonAlwaysString().fromJson(json['id']),
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$$_ArticleModelToJson(_$_ArticleModel instance) =>
    <String, dynamic>{
      'width': const JsonAlwaysNum().toJson(instance.width),
      'height': const JsonAlwaysNum().toJson(instance.height),
      'id': const JsonAlwaysString().toJson(instance.id),
      'url': instance.url,
    };
