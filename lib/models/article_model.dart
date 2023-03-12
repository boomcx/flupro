import 'package:flupro/base/extensions/json_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'article_model.freezed.dart';
part 'article_model.g.dart';

@freezed
class ArticleModel with _$ArticleModel {
  const factory ArticleModel({
    @JsonAlwaysNum() @Default(0) num userId,
    @JsonAlwaysNum() @Default(0) num id,
    @Default('') String body,
    @Default('') String title,
  }) = _ArticleModel;
  factory ArticleModel.fromJson(Map<String, Object?> json) =>
      _$ArticleModelFromJson(json);
}
