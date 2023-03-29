import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './state.dart';
import 'route/trans_dialog.dart';

class DropEntity {
  /// 控制可显示内容高度比例，1.0完全占满
  final double scale;

  /// 弹框视图
  final Widget child;

  DropEntity({this.scale = 0.7, required this.child});
}

extension DropdwonBtnsExt on Widget {
  /// 快速构建 `PopupBtns` builder 数组集
  DropEntity entity([double scale = 0.7]) {
    return DropEntity(child: this, scale: scale);
  }

  /// 显示占据部分高度
  DropEntity get heightPart => DropEntity(child: this, scale: 0.7);

  /// 显示占满全部空间
  DropEntity get heightFull => DropEntity(child: this, scale: 1);
}

///
/// 
///
class DropdownBtns extends StatefulWidget {
  const DropdownBtns({
    super.key,
    required this.items,
    required this.builder,
    this.height = kMinInteractiveDimensionCupertino,
    this.prefix,
    this.suffix,
    this.changedMark = true,
    this.isShowBorder = true,
  });

  /// 前置视图
  final Widget? prefix;

  /// 后置视图
  final Widget? suffix;

  /// 标题
  final List<String> items;

  /// 弹框构建
  final List<DropEntity> Function(PopupValueNotifier) builder;

  /// 高度
  final double height;

  /// 标题改变后 是否标记选中状态
  final bool changedMark;

  /// 是否显示上下边框
  final bool isShowBorder;

  @override
  State<DropdownBtns> createState() => _DropdownBtnsState();
}

class _DropdownBtnsState extends State<DropdownBtns> {
  late PopupValueNotifier _notifier;

  // final Map<String, PopupEntity> childReposity = {};

  @override
  void initState() {
    _notifier = PopupValueNotifier(PopupState(
      items: List.of(widget.items),
      orginItems: List.of(widget.items),
    ));
    super.initState();

    _notifier.addListener(() {
      _closeWidget();
      if (_notifier.value.selected > -1) {
        _showWidget();
      }
    });
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _CompsitedTarget(
      notifier: _notifier,
      widget: widget,
      isShowBorder: widget.isShowBorder,
    );
  }

  _showWidget() {
    final selected = _notifier.value.selected;

    // if (childReposity[selected.toString()] == null) {
    //   final entity = widget.builder.call(_notifier)[selected];
    //   childReposity[selected.toString()] = entity;
    // }

    _CompositedFollower(
      ctx: context,
      notifier: _notifier,
      widget: widget,
      entity: widget.builder.call(_notifier)[selected],
    ).show();
  }

  _closeWidget() {
    for (var state in _notifier.status) {
      if (state.isOpen) {
        Navigator.pop(state.context!);
        // 可以触发 `GetxController` 的销毁
        // Get.back();
      }
    }
    for (var i = 0; i < _notifier.status.length; i++) {
      _notifier.status[i].isOpen = false;
    }
  }
}

class _CompositedFollower extends StatelessWidget {
  _CompositedFollower({
    Key? key,
    required this.ctx,
    required PopupValueNotifier notifier,
    required this.widget,
    required this.entity,
  })  : _notifier = notifier,
        super(key: key) {
    final render =
        _notifier.targetKey.currentContext!.findRenderObject() as RenderBox;
    final position = render.localToGlobal(Offset.zero);
    _contentHeight = MediaQuery.of(ctx).size.height -
        position.dy -
        MediaQuery.of(ctx).padding.bottom -
        widget.height;
  }

  final BuildContext ctx;
  final DropdownBtns widget;
  final PopupValueNotifier _notifier;
  late final double _contentHeight;
  final DropEntity entity;

  /// 显示内容
  Future show() {
    final selected = _notifier.value.selected;

    _notifier.status[selected].isOpen = true;
    _notifier.status[selected].context = ctx;

    return showDropView(context: ctx, key: _notifier.targetKey, page: this)
        .then((value) {
      if (_notifier.status[selected].isOpen) {
        _notifier.status[selected].isOpen = false;
        _notifier.closeDialog();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformFollower(
      link: _notifier.link,
      showWhenUnlinked: false,
      offset: Offset(0, widget.height),
      child: Stack(
        children: [
          Container(),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
            ),
            constraints: BoxConstraints(
              maxHeight: _contentHeight * entity.scale,
            ),
            child: entity.child,
          )
        ],
      ),
    );
  }
}

class _CompsitedTarget extends StatelessWidget {
  const _CompsitedTarget({
    required PopupValueNotifier notifier,
    required this.widget,
    required this.isShowBorder,
  }) : _notifier = notifier;

  final PopupValueNotifier _notifier;
  final DropdownBtns widget;
  final bool isShowBorder;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width / widget.items.length;

    return CompositedTransformTarget(
      key: _notifier.targetKey,
      link: _notifier.link,
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.white,
          border: isShowBorder
              ? const Border(
                  top: BorderSide(width: 1, color: Color(0xffeeeeee)),
                  bottom: BorderSide(width: 1, color: Color(0xffeeeeee)),
                )
              : null,
        ),
        child: Row(children: [
          if (widget.prefix != null) widget.prefix!,
          ...List.generate(
            widget.items.length,
            (index) => Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  _notifier.updateSelected(index);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: ValueListenableBuilder<PopupState>(
                    valueListenable: _notifier,
                    builder: (context, value, child) {
                      return _Button(
                        value.items[index],
                        value.selected == index,
                        maxWidth: maxWidth,
                        isChanged: widget.changedMark
                            ? value.items[index] != value.orginItems[index]
                            : false,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          if (widget.suffix != null) widget.suffix!,
        ]),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(this.name, this.isSelected,
      {this.maxWidth = 20, this.isChanged = false});

  final double maxWidth;
  final String name;
  final bool isSelected;
  final bool isChanged;

  @override
  Widget build(BuildContext context) {
    final flag = isSelected || isChanged;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth - 15 - 16,
            ),
            child: Text(
              name,
              style: TextStyle(
                color: flag ? const Color(0xffE72410) : const Color(0xff20263A),
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          // const SizedBox(width: 4),
          AnimatedRotation(
            turns: isSelected ? -0.5 : 0,
            duration: const Duration(milliseconds: 250),
            child: Icon(
              Icons.arrow_drop_up_rounded,
              size: 25,
              color: flag
                  ? const Color.fromARGB(255, 236, 46, 25)
                  : const Color(0xff9B9EAC),
            ),
            // child: Assets.images.selectedNotShow.image(
            //   width: 10,
            //   fit: BoxFit.contain,
            //   color: flag
            //       ? const Color.fromARGB(255, 236, 46, 25)
            //       : const Color(0xff9B9EAC),
            // ),
          ),
        ],
      ),
    );
  }
}
