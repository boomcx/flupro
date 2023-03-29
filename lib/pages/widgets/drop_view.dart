import 'package:flupro/base/widgets/app_bar.dart';
import 'package:flupro/custom/drop_btns/view.dart';
import 'package:flutter/material.dart';

class DropView extends StatelessWidget {
  const DropView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AAppBar(title: '下拉弹框'),
      body: Column(
        children: [
          DropdownBtns(
            items: const ['title1', 'title2'],
            builder: (p0) => [
              Container(color: Colors.red, height: 200).heightPart,
              Container(color: Colors.yellow, height: 600).heightPart,
            ],
          ),
          DropdownBtns(
            items: const ['title3', 'title4'],
            builder: (p0) => [
              Container(color: Colors.blue, height: 150).heightPart,
              Container(color: Colors.green, height: 300).heightPart,
            ],
          ),
        ],
      ),
    );
  }
}
