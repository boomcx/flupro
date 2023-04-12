import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

mixin PagingMixin<T> {
  /// 分页起始页码
  int _initPage = 0;
  int _page = 0;

  PagingController<int, T> _pagingController =
      PagingController(firstPageKey: 0);
  PagingController<int, T> get pagingController => _pagingController;
  Completer? _refreshComplater;
  List<T> get items => _pagingController.itemList ?? [];
  bool _isRefreshing = false;

  void initPaging(Ref ref, {int initPage = 0}) {
    if (_initPage != initPage) {
      _initPage = initPage;
      _pagingController.dispose();
      _pagingController =
          PagingController(firstPageKey: initPage, invisibleItemsThreshold: 1);
    }

    if (!_isRefreshing) {
      _pagingController.addPageRequestListener(loadData);
    } else {
      _pagingController.notifyPageRequestListeners(1);
    }
    ref.onDispose(() {
      _isRefreshing = true;
    });
  }

  /// 重置加载的错误显示
  void retryLastFailedRequest() {
    _pagingController.retryLastFailedRequest();
  }

  /// 刷新数据
  Future refresh() {
    _refreshComplater = Completer();
    retryLastFailedRequest();
    _pagingController.notifyPageRequestListeners(1);
    return _refreshComplater!.future;
  }

  /// 数据加载（网络请求）
  FutureOr loadData(int page);

  /// 获取数据前调用
  void beginLoad(int page) {
    _page = page;
  }

  /// 获取数据后调用
  /// `items` 列表数据
  /// `maxCount` 数据总数，如果为0则默认通过 `items` 有无数据判断是否可以分页加载
  /// `error` 错误信息
  /// `limit` 单页显示数量限制，如果items.length < limit 则没有更多数据
  void endLoad(
    List<T>? list, {
    int maxCount = 0,
    int limit = 5,
    dynamic error,
  }) {
    if (_page == 1) {
      _refreshComplater?.complete();
      _refreshComplater = null;
    }

    if (list != null) {
      // 默认有总数量 `maxCount`, 则判断当前请求数据list+历史数据items是否小于总数
      // bool hasNoMore = !((items.length + list.length) < maxCount);

      // 默认没有总数量 `maxCount`，用获取当前数据列表是否有值判断
      bool hasNoMore = list.length < limit;

      if (_page == _initPage && this.items.isNotEmpty) {
        updateItems([]);
      }

      if (hasNoMore) {
        _pagingController.appendLastPage(list);
      } else {
        if (list.isNotEmpty) {
          _pagingController.appendPage(list, _page + 1);
        }
      }
    } else {
      // _pagingController.appendLastPage([]);
      _pagingController.error = error;
    }
  }

  void updateItems(List<T> items) {
    _pagingController.itemList = items;
  }
}
