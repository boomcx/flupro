import 'package:flupro/app.dart';
import 'package:flupro/base/widgets/app_bar.dart';
import 'package:flupro/base/widgets/highlighted_button.dart';
import 'package:flupro/base/widgets/popup_message.dart';
import 'package:flupro/base/widgets/primary_button.dart';
import 'package:flupro/custom/drop_btns/view.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AAppBar(
        title: '自定义组件',
      ),
      body: Wrap(
        children: [
          PrimaryButton(
              title: '阴影气泡弹窗',
              onTap: () {
                context.push('/widgets/bubble');
              }),
          PrimaryButton(
              title: '下拉筛选框',
              onTap: () {
                context.push('/widgets/drop');
              }),
        ],
      ),
    );
  }
}
