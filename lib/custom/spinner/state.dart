import 'package:flutter/material.dart';

class PopupState {
  List<String> items;
  final List<String> orginItems;
  int selected;

  PopupState({
    required this.items,
    required this.orginItems,
    this.selected = -1,
  });
}

class PopupValueNotifier extends ValueNotifier<PopupState> {
  PopupValueNotifier(PopupState state)
      : status = state.orginItems.map((e) => false).toList(),
        super(state);

  final link = LayerLink();
  final GlobalKey targetKey = GlobalKey();

  /// 保存每个选项卡对应的视图是否打开
  final List<bool> status;

  /// 关闭pop
  closeDialog() {
    updateSelected(-1);
  }

  /// 设置当前选中的选项
  updateSelected(int index) {
    if (value.selected == index) {
      value.selected = -1;
    } else {
      value.selected = index;
    }
    notifyListeners();
  }

  /// 手动更新选项文字显示
  updateName(String name, {bool needClose = true}) {
    if (value.orginItems.isNotEmpty && value.selected > -1) {
      value.items[value.selected] = name;
    }
    if (needClose) {
      closeDialog();
    } else {
      notifyListeners();
    }
  }

  /// 重置选项显示
  reset({bool needClose = true}) {
    value.items[value.selected] = value.orginItems[value.selected];
    if (needClose) {
      closeDialog();
    } else {
      notifyListeners();
    }
  }
}
