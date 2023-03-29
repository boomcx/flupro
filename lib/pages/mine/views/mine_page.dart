import 'package:flupro/app.dart';
import 'package:flupro/base/widgets/popup_message.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _PositionPopup(
          child: _textChild(),
        ),
        _PositionPopup(
          left: 10,
          top: 10,
          child: _textChild(),
        ),
      ]),
    );
  }

  PopupMessage _textChild() {
    return const PopupMessage(
      content: Text(
        '当前时间段投资次数前十的赛道当前时间段投资次数前十的赛道当前时间段投资次数前十的赛道',
        style: TextStyle(fontSize: 12.0, color: Color(0xff74798C), height: 1.5),
      ),
      child: ElevatedButton(
        onPressed: null,
        child: Text('文字显示'),
      ),
    );
  }
}

class _PositionPopup extends StatelessWidget {
  const _PositionPopup({
    super.key,
    this.left = 380,
    this.top = 750,
    required this.child,
  });

  final double left;
  final double top;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      // bottom: 10,
      child: child,
    );
  }
}
