import 'dart:async';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

mixin PagingMixin<T> {
  final PagingController<int, T> _pagingController =
      PagingController(firstPageKey: 1);
  PagingController<int, T> get pagingController => _pagingController;
  int _page = 1;
  Completer? _refreshComplater;
  List<T> get items => _pagingController.itemList ?? [];
  bool _isRefreshing = false;

  void initPaging() {
    if (!_isRefreshing) {
      _pagingController.addPageRequestListener(loadData);
    } else {
      _pagingController.notifyPageRequestListeners(1);
    }
    // ref.onDispose(() {
      // _isRefreshing = true;
    // });
  }

  Future refresh() {
    _refreshComplater = Completer();
    _pagingController.notifyPageRequestListeners(1);
    return _refreshComplater!.future;
  }

  FutureOr loadData(int page);

  void beginLoad(int page) {
    _page = page;
  }

  void endLoad({List<T>? items, dynamic error}) {
    if (_page == 1) {
      _refreshComplater?.complete();
      _refreshComplater = null;
    }
    if (items != null) {
      final noMore = items.isEmpty;
      if (_page == 1 && this.items.isNotEmpty) {
        updateItems([]);
      }
      if (noMore) {
        _pagingController.appendLastPage(items);
      } else {
        _pagingController.appendPage(items, _page + 1);
      }
    } else {
      _pagingController.error = error;
    }
  }

  void updateItems(List<T> items) {
    _pagingController.itemList = items;
  }
}
