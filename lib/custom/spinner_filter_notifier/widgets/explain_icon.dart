part of '../spinner_filter.dart';

class _ExplainIcon extends StatelessWidget {
  const _ExplainIcon({
    required this.desc,
  });

  final String desc;

  @override
  Widget build(BuildContext context) {
    return PopupMessage(
      bgColor: Colors.black54,
      content: Text(
        desc,
        style: const TextStyle(color: Colors.white, height: 1.5, fontSize: 13),
      ),
      child: Assets.images.iconExplain.image(width: 15, fit: BoxFit.contain),
    );
  }
}
