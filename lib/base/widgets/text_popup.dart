import 'package:flutter/material.dart';

class PopupMessage extends StatefulWidget {
  const PopupMessage({
    super.key,
    required this.child,
    required this.text,
    this.padding = const EdgeInsets.all(10.0),
    this.style =
        const TextStyle(fontSize: 12.0, color: Color(0xff74798C), height: 1.5),
    this.margin = EdgeInsets.zero,
  });

  final Widget child;
  final String text;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final TextStyle style;

  @override
  State<PopupMessage> createState() => _PopupMessageState();
}

class _PopupMessageState extends State<PopupMessage> {
  final LayerLink _link = LayerLink();

  _showText() {
    final box = context.findRenderObject() as RenderBox;
    final offset = box.localToGlobal(Offset.zero);

    return showDialog(
      context: context,
      barrierColor: const Color(0x01000000),
      builder: (context) {
        return CompositedTransformFollower(
          link: _link,
          offset: Offset(-offset.dx, box.size.height + 7),
          child: Align(
            alignment: Alignment.topLeft,
            child: CustomPaint(
              painter: PopupMsgPainter(
                parentRect: offset & box.size,
                text: widget.text,
                style: widget.style,
                context: context,
                padding: widget.padding,
                margin: widget.margin,
              ),
              child: Opacity(
                opacity: 0,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  padding: widget.padding,
                  child: Text(widget.text, style: widget.style),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: GestureDetector(
        onTap: _showText,
        child: widget.child,
      ),
    );
  }
}

class PopupMsgPainter extends CustomPainter {
  const PopupMsgPainter({
    required this.parentRect,
    required this.text,
    required this.style,
    required this.context,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.arrowSize = const Size(7, 7),
  });

  final Rect parentRect;
  final BuildContext context;
  final Size arrowSize;
  final String text;
  final TextStyle style;
  final EdgeInsets padding;
  final EdgeInsets margin;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = getContentRect(parentRect, size);
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(4));

    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    final path = Path();

    final centerX = parentRect.left + parentRect.size.width / 2;
    final arrowY = getArrowY(parentRect, size);

    path.moveTo(centerX - arrowSize.width / 1.2, arrowY);
    path.lineTo(
        centerX, arrowY < 0 ? arrowY + arrowSize.height : -arrowSize.height);
    path.lineTo(centerX + arrowSize.width / 1.2, arrowY);
    path.addRRect(rrect);
    canvas.drawShadow(
        Path()
          ..addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(
                rect.left - arrowSize.width / 2,
                rect.top - arrowSize.height,
                rect.width + arrowSize.width,
                rect.height + arrowSize.height,
              ),
              const Radius.circular(4))),
        Colors.black26,
        5,
        false);
    canvas.drawPath(path, paint);

    TextPainter(
        text: TextSpan(text: text, style: style),
        textDirection: TextDirection.ltr)
      ..layout(
          maxWidth: size.width - padding.left * 2,
          minWidth: size.width - padding.left * 2)
      ..paint(
          canvas, Offset(padding.left + rect.left, padding.left + rect.top));
  }

  double getArrowY(Rect target, Size size) {
    double dy = 0;
    final sh = MediaQuery.of(context).size.height;

    if (target.bottom + size.height > sh) {
      dy = -(target.height + arrowSize.height * 2 + margin.bottom);
    }
    return dy;
  }

  Rect getContentRect(Rect target, Size size) {
    const insets = EdgeInsets.all(10);

    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    Offset offset = Offset.zero;

    // 超出左边屏幕
    if (target.center.dx < size.width / 2) {
      offset = Offset(insets.left, 0);
    }
    // 超出屏幕右边
    else if (target.center.dx + size.width / 2 > sw) {
      offset = Offset(sw - size.width - insets.right, 0);
    }
    // 居中
    else {
      offset = Offset(target.center.dx - size.width / 2, 0);
    }

    // 底部溢出
    if (target.bottom + size.height > sh) {
      offset = Offset(
        offset.dx,
        -(target.height + size.height + arrowSize.height * 2 + margin.bottom),
      );
    }

    return offset & size;
  }

  @override
  bool shouldRepaint(PopupMsgPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(PopupMsgPainter oldDelegate) => false;
}
