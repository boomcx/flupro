export './state.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './state.dart';
import 'route/trans_dialog.dart';

class SpinnerScope {
  /// 控制可显示内容高度比例，1.0完全占满
  final double scale;

  /// 弹框视图
  final Widget child;

  SpinnerScope({this.scale = 0.7, required this.child});
}

extension SpinnerBoxExt on Widget {
  /// 快速构建 `PopupBtns` builder 数组集
  SpinnerScope entity([double scale = 0.7]) {
    return SpinnerScope(child: this, scale: scale);
  }

  /// 显示占据部分高度
  SpinnerScope get heightPart => SpinnerScope(child: this, scale: 0.7);

  /// 显示占满全部空间
  SpinnerScope get heightFull => SpinnerScope(child: this, scale: 1);
}

class SpinnerBoxConfig {
  /// 高度
  final double height;

  // 边距，额外高度
  final EdgeInsets padding;

  /// 默认字体
  final TextStyle textStyle;

  /// 选中后的字体
  final TextStyle changedStyle;

  /// 背景颜色
  final Color bgColor;

  /// 三角标颜色
  final Color arrowColor;

  /// 标题改变后 是否标记选中状态
  final bool changedMark;

  // 是否显示边框
  final bool isShowBorder;

  const SpinnerBoxConfig({
    this.height = kMinInteractiveDimensionCupertino,
    this.textStyle = const TextStyle(
      color: Color(0xff20263A),
      fontSize: 14,
    ),
    this.changedStyle = const TextStyle(
      color: Color(0xffE72410),
      fontSize: 14,
    ),
    this.changedMark = true,
    this.isShowBorder = true,
    this.bgColor = Colors.white,
    this.arrowColor = const Color(0xff9B9EAC),
    this.padding = EdgeInsets.zero,
  });

  SpinnerBoxConfig copyWith({
    double? height,
    TextStyle? textStyle,
    TextStyle? changedStyle,
    Color? bgColor,
    Color? arrowColor,
    bool? changedMark,
    bool? isShowBorder,
    EdgeInsets? padding,
  }) {
    return SpinnerBoxConfig(
      height: height ?? this.height,
      textStyle: textStyle ?? this.textStyle,
      changedStyle: changedStyle ?? this.changedStyle,
      bgColor: bgColor ?? this.bgColor,
      arrowColor: arrowColor ?? this.arrowColor,
      changedMark: changedMark ?? this.changedMark,
      isShowBorder: isShowBorder ?? this.isShowBorder,
      padding: padding ?? this.padding,
    );
  }
}

extension SpinnerConfigExt on SpinnerBoxConfig {
  double get totalHeight => height + padding.top + padding.bottom;
}

/// 默认配置
const SpinnerBoxConfig defaultPopConfig = SpinnerBoxConfig();

class SpinnerBox extends StatefulWidget {
  const SpinnerBox({
    super.key,
    required this.titles,
    required this.builder,
    this.prefix,
    this.suffix,
    this.config = defaultPopConfig,
  });

  /// 前置视图
  final Widget? prefix;

  /// 后置视图
  final Widget? suffix;

  /// 标题
  final List<String> titles;

  /// 弹框内容构建
  final List<SpinnerScope> Function(PopupValueNotifier) builder;

  /// 视图配置
  final SpinnerBoxConfig config;

  @override
  State<SpinnerBox> createState() => _SpinnerBoxState();
}

class _SpinnerBoxState extends State<SpinnerBox> {
  late PopupValueNotifier _notifier;

  /// 当前的显示的页面路由（指定关闭当前弹框，解决焦点失活跳转页面异常）
  TransPopupRouter? _router;

  // final Map<String, PopupEntity> childReposity = {};

  @override
  void initState() {
    _notifier = PopupValueNotifier(PopupState(
      items: List.of(widget.titles),
      orginItems: List.of(widget.titles),
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
      config: widget.config,
    );
  }

  _showWidget() {
    final selected = _notifier.value.selected;

    // if (childReposity[selected.toString()] == null) {
    //   final entity = widget.builder.call(_notifier)[selected];
    //   childReposity[selected.toString()] = entity;
    // }

    final content = _CompositedFollower(
      ctx: context,
      notifier: _notifier,
      widget: widget,
      entity: widget.builder.call(_notifier)[selected],
    );

    _router = TransPopupRouter(
      targetCtx: _notifier.targetKey.currentContext,
      barrierColor: Colors.black12,
      pageBuilder: (context, animation, secondaryAnimation) => content,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return Align(
          alignment: Alignment.topCenter,
          child: SizeTransition(
            sizeFactor: CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            ),
            child: FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              ),
              child: child,
            ),
          ),
        );
      },
    );

    content.show(_router);
  }

  _closeWidget() {
    for (var state in _notifier.status) {
      if (state) {
        if (_router == null) {
          Navigator.pop(context);
        } else {
          Navigator.removeRoute(context, _router!);
        }
      }
    }
    for (var i = 0; i < _notifier.status.length; i++) {
      _notifier.status[i] = false;
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
        widget.config.totalHeight;
  }

  final BuildContext ctx;
  final SpinnerBox widget;
  final PopupValueNotifier _notifier;
  late final double _contentHeight;
  final SpinnerScope entity;

  /// 显示内容
  Future show(router) {
    final selected = _notifier.value.selected;

    _notifier.status[selected] = true;

    return Navigator.of(ctx).push(router).then((value) {
      if (_notifier.status[selected]) {
        _notifier.status[selected] = false;
        _notifier.closeDialog();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformFollower(
      link: _notifier.link,
      showWhenUnlinked: false,
      offset: Offset(0, widget.config.totalHeight),
      child: FocusScope(
        autofocus: true,
        onFocusChange: (value) {
          if (!value) {
            _notifier.closeDialog();
          }
        },
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
      ),
    );
  }
}

class _CompsitedTarget extends StatelessWidget {
  const _CompsitedTarget({
    required PopupValueNotifier notifier,
    required this.widget,
    required this.config,
  }) : _notifier = notifier;

  final PopupValueNotifier _notifier;
  final SpinnerBox widget;

  /// 视图配置
  final SpinnerBoxConfig config;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _notifier.link,
      child: Container(
        key: _notifier.targetKey,
        // height: config.height,
        height: config.totalHeight,
        padding: config.padding,
        decoration: BoxDecoration(
          color: config.bgColor,
          border: config.isShowBorder
              ? const Border(
                  top: BorderSide(width: 1, color: Color(0xffeeeeee)),
                  bottom: BorderSide(width: 1, color: Color(0xffeeeeee)),
                )
              : null,
        ),
        child: Row(children: [
          if (widget.prefix != null) widget.prefix!,
          ...List.generate(
            widget.titles.length,
            (index) => Expanded(
              child: LayoutBuilder(builder: (_, constraints) {
                return GestureDetector(
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
                          config,
                          maxWidth: constraints.minWidth,
                          isChanged: config.changedMark
                              ? value.items[index] != value.orginItems[index]
                              : false,
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
          ),
          if (widget.suffix != null) FocusScope(child: widget.suffix!),
        ]),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
    this.name,
    this.isSelected,
    this.config, {
    this.maxWidth = 20,
    this.isChanged = false,
  });

  final double maxWidth;
  final String name;
  final bool isSelected;
  final bool isChanged;

  /// 视图配置
  final SpinnerBoxConfig config;

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
              style: flag ? config.changedStyle : config.textStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 4),
          AnimatedRotation(
            turns: isSelected ? -0.5 : 0,
            duration: const Duration(milliseconds: 250),
            child: Icon(
              Icons.arrow_drop_up_rounded,
              size: 25,
              color: flag ? config.changedStyle.color : config.arrowColor,
            ),
          ),
        ],
      ),
    );
  }
}
