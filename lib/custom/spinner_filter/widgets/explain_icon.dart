part of '../spinner_filter.dart';

class _ExplainIcon extends StatelessWidget {
  const _ExplainIcon({
    required this.desc,
  });

  final String desc;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return PopupMessage(
      content: Text(desc,
          style: TextStyle(color: appColors.text4, height: 1.5, fontSize: 12)),
      child: Assets.images.iconExplain.image(width: 16, fit: BoxFit.contain),
    );
  }
}
