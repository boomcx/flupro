import 'package:flupro/support_files/theme.dart';
import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Container(
          constraints: const BoxConstraints(
              minHeight: kMinInteractiveDimensionCupertino),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: colors.primary.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 10),
              )
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: colors.comFFF,
            ),
          ),
        ),
      ),
    );
  }
}
