import 'package:flutter/material.dart';

class SelectableItemNotifier<T> extends ChangeNotifier {
  SelectableItemNotifier(this.value);

  final T value;

  bool _selected = false;
  bool get selected => _selected;
  set selected(bool value) {
    _selected = value;
    notifyListeners();
  }

  bool _allowSelect = true;
  bool get allowSelect => _allowSelect;
  set allowSelect(bool value) {
    _allowSelect = value;
    notifyListeners();
  }
}
