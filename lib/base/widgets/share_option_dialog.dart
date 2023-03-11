// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../support_files/theme.dart';

// enum ShareType {
//   weixin,
//   qq,
//   weibo,
//   poster,
//   square,
//   group,
//   teacher,
// }

// class ShareOptionDialog extends StatelessWidget {
//   const ShareOptionDialog({super.key});

//   Future<ShareType?> show(BuildContext context) {
//     return showGeneralDialog(
//       context: context,
//       barrierDismissible: true,
//       barrierLabel: 'ShareOptionDialog',
//       transitionBuilder: (context, animation, secondaryAnimation, child) =>
//           bottomSlideAnimation(context, animation, child),
//       pageBuilder: (context, animation, secondaryAnimation) => this,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final colors = context.appColors;
//     return Material(
//       color: Colors.transparent,
//       child: Container(
//         decoration: BoxDecoration(
//           color: colors.background,
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
//         ),
//         child: SafeArea(
//           top: false,
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   children: [
//                     const Expanded(
//                       child: Text(
//                         '分享',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     CupertinoButton(
//                       padding: EdgeInsets.zero,
//                       child: Icon(
//                         Icons.close_rounded,
//                         color: colors.text3,
//                       ),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: _ImageButton(
//                         title: '微信',
//                         image: AssetImage(Assets.images.icShareWeixin.path),
//                         onTap: () {
//                           Navigator.of(context).pop(ShareType.weixin);
//                         },
//                       ),
//                     ),
//                     Expanded(
//                       child: _ImageButton(
//                         title: 'QQ',
//                         image: AssetImage(Assets.images.icShareQq.path),
//                         onTap: () {
//                           Navigator.of(context).pop(ShareType.qq);
//                         },
//                       ),
//                     ),
//                     Expanded(
//                       child: _ImageButton(
//                         title: '微博',
//                         image: AssetImage(Assets.images.icShareWeibo.path),
//                         onTap: () {
//                           Navigator.of(context).pop(ShareType.weibo);
//                         },
//                       ),
//                     ),
//                     Expanded(
//                       child: _ImageButton(
//                         title: '生成海报',
//                         image: AssetImage(Assets.images.icSharePoster.path),
//                         onTap: () {
//                           Navigator.of(context).pop(ShareType.poster);
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: _ImageButton(
//                         title: '广场',
//                         image: AssetImage(Assets.images.icShareSquare.path),
//                         onTap: () {
//                           Navigator.of(context).pop(ShareType.square);
//                         },
//                       ),
//                     ),
//                     Expanded(
//                       child: _ImageButton(
//                         title: '小组',
//                         image: AssetImage(Assets.images.icShareGroup.path),
//                         onTap: () {
//                           Navigator.of(context).pop(ShareType.group);
//                         },
//                       ),
//                     ),
//                     Expanded(
//                       child: _ImageButton(
//                         title: '教师',
//                         image: AssetImage(Assets.images.icShareTeacher.path),
//                         onTap: () {
//                           Navigator.of(context).pop(ShareType.teacher);
//                         },
//                       ),
//                     ),
//                     const Spacer()
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _ImageButton extends ConsumerWidget {
//   const _ImageButton({
//     Key? key,
//     required this.title,
//     required this.image,
//     required this.onTap,
//   }) : super(key: key);

//   final String title;
//   final ImageProvider image;

//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Image(
//             image: image,
//             width: 44,
//             height: 44,
//           ),
//           const SizedBox(height: 4),
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 12,
//               color: context.appColors.text3,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
