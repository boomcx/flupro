import 'package:flupro/base/refresh/refresh.dart';
import 'package:flupro/models.dart';
import 'package:flupro/network/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article_provider.g.dart';

@riverpod
class ArticleListNotifier extends _$ArticleListNotifier
    with PagingMixin<ArticleModel> {
  @override
  PagingController<int, ArticleModel> build() {
    initPaging(ref);
    return pagingController;
  }

  @override
  FutureOr loadData(int page) async {
    beginLoad(page);

    try {
      final items = await ref.read(apiClientProvider).getArticle();
      endLoad(items: items);
    } catch (e) {
      print(e);
    }
  }
}
