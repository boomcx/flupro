import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';


class _NoMore extends StatelessWidget {
  const _NoMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Text(
        '- 没有更多数据了 -',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.blueGrey[100],
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppProgressIndicator(
            size: 25,
            color1: Colors.blue.withOpacity(0),
            color2: Colors.blue,
          ),
          const SizedBox(width: 8),
          Text(
            '加载中...',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}

PagedChildBuilderDelegate<ItemType> pagedChildDelegate<ItemType>(
  ItemWidgetBuilder<ItemType> builder, {
  WidgetBuilder? loadingView,
  WidgetBuilder? emptyView,
}) =>
    PagedChildBuilderDelegate<ItemType>(
      itemBuilder: builder,
      firstPageErrorIndicatorBuilder:
          emptyView ?? (context) => const DefaultEmptyDataView(),
      firstPageProgressIndicatorBuilder:
          loadingView ?? (context) => const LoadingEmptyDataView(),
      noItemsFoundIndicatorBuilder:
          emptyView ?? (context) => const DefaultEmptyDataView(),
      newPageProgressIndicatorBuilder: (_) => const _Loading(),
      noMoreItemsIndicatorBuilder: (_) => const _NoMore(),
      newPageErrorIndicatorBuilder: (context) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              '加载失败',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey[100],
              ),
            ),
          ),
        );
      },
    );
