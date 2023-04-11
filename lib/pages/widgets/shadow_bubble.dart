import 'package:flupro/base/widgets/app_bar.dart';
import 'package:flupro/base/widgets/popup_message.dart';
import 'package:flupro/base/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ShadowBubble extends StatelessWidget {
  const ShadowBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AAppBar(title: '阴影气泡'),
      body: Stack(
        children: [
          Positioned(
            left: 10,
            top: 100,
            child: _textChild(),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: _textChild(),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: _textChild(),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: _textChild(),
          ),
        ],
      ),
    );
  }

  PopupMessage _textChild() {
    return const PopupMessage(
      content: Text(
        '当前时间段投资次数前十的赛道当前时间段投资次数前十的赛道当前时间段投资次数前十的赛道',
        style: TextStyle(fontSize: 12.0, color: Color(0xff74798C), height: 1.5),
      ),
      child: PrimaryButton(
        title: '点我点我',
        onPressed: null,
      ),
    );
  }
}
