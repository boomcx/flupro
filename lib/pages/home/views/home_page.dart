import 'package:flupro/app.dart';
import 'package:flupro/base/refresh/refresh.dart';
import 'package:flupro/base/widgets/app_bar.dart';
import 'package:flupro/models.dart';

import '../providers/article_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AAppBar(
        title: '刷新加载',
      ),
      body: PullRefreshControl(
        onRefresh: () {
          ref.read(articleListNotifierProvider.notifier).refresh();
        },
        childBuilder: (BuildContext context, ScrollPhysics physics) {
          return PagedListView<int, ArticleModel>(
            physics: physics,
            pagingController: ref.watch(articleListNotifierProvider),
            builderDelegate: pagedChildDelegate(
              (context, item, index) {
                return Card(
                  child: ListTile(
                    title: Text(item.id),
                    subtitle: Text(item.url),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
