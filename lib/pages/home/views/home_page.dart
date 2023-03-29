import 'package:flupro/app.dart';
import 'package:flupro/base/refresh/paged_control.dart';
import 'package:flupro/models.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../providers/article_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PagedListView<int, ArticleModel>(
      pagingController: ref.watch(articleListNotifierProvider),
      builderDelegate: pagedChildDelegate(
        (context, item, index) {
          return Card(
            child: ListTile(
              title: Text(item.title),
              subtitle: Text(item.body),
            ),
          );
        },
      ),
    );
    ;
  }
}
