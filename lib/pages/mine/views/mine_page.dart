import 'package:flupro/app.dart';
import 'package:flupro/base/widgets/text_popup.dart';

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
        Positioned(
          left: 230,
          // top: 10,
          bottom: 10,
          child: PopupMessage(
              text: '当前时间段投资次数前十的赛道当前时间段投资次数前十的赛道当前时间段投资次数前十的赛道',
              child: Container(
                width: 60,
                height: 60,
                color: Colors.red,
              )),
        ),
      ]),
    );
  }
}
