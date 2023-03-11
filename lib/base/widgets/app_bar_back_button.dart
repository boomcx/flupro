import 'package:flupro/support_files/theme.dart';
import 'package:flutter/cupertino.dart';

import '../../support_files/assets.gen.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Assets.images.icNavBack.image(
        width: 22,
        height: 22,
        color: color ?? context.appColors.text1,
      ),
      onPressed: () {
        Navigator.of(context).maybePop();
      },
    );
  }
}
