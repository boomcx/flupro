// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticleModel _$$_ArticleModelFromJson(Map<String, dynamic> json) =>
    _$_ArticleModel(
      userId: json['userId'] == null
          ? 0
          : const JsonAlwaysNum().fromJson(json['userId']),
      id: json['id'] == null ? 0 : const JsonAlwaysNum().fromJson(json['id']),
      body: json['body'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$$_ArticleModelToJson(_$_ArticleModel instance) =>
    <String, dynamic>{
      'userId': const JsonAlwaysNum().toJson(instance.userId),
      'id': const JsonAlwaysNum().toJson(instance.id),
      'body': instance.body,
      'title': instance.title,
    };
