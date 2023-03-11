import 'package:bot_toast/bot_toast.dart';
import 'package:flupro/support_files/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DebugDialog extends ConsumerWidget {
  const DebugDialog({
    super.key,
    required this.content,
    required this.cancelFunc,
  });

  final String content;
  final VoidCallback cancelFunc;

  static void show(String content) {
    BotToast.showWidget(toastBuilder: (cancelFunc) {
      return DebugDialog(
        content: content,
        cancelFunc: cancelFunc,
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          width: 300,
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            color: context.appColors.background,
            borderRadius: BorderRadius.circular(kDefaultRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPaddingLR),
                  child: Text(
                    content,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      child: const Text(
                        '复制',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: content));
                      },
                    ),
                  ),
                  Expanded(
                    child: CupertinoButton(
                      child: const Text(
                        '关闭',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {
                        cancelFunc();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
