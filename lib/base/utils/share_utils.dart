// import 'package:flutter/material.dart'; 

// class ShareUtils {
//   static void share(
//     BuildContext context,
//     WidgetRef ref, {
//     required ResourceType type,
//     required String relationId,
//     required String corpusId,
//   }) async {
//     final shareType = await const ShareOptionDialog().show(context);
//     if (shareType == null) return;
//     switch (shareType) {
//       case ShareType.weixin:
//         break;
//       case ShareType.qq:
//         break;
//       case ShareType.weibo:
//         break;
//       case ShareType.poster:
//         break;
//       case ShareType.square:
//         shareToSquare(context, ref,
//             type: type, relationId: relationId, corpusId: corpusId);
//         break;
//       case ShareType.group:
//         shareToGroup(context, ref,
//             type: type, relationId: relationId, corpusId: corpusId);
//         break;
//       case ShareType.teacher:
//         shareToTeacher(context, ref,
//             type: type, relationId: relationId, corpusId: corpusId);
//         break;
//     }
//   }

//   static void shareToSquare(
//     BuildContext context,
//     WidgetRef ref, {
//     required ResourceType type,
//     required String relationId,
//     required String corpusId,
//   }) async {
//     final category = await const SquareCategoryPicker().show(context);
//     if (category == null) return;
//     Toast.showLoading();
//     try {
//       await ref.read(apiClientProvider).shareResource(ShareResourceParams(
//             type: type,
//             relationId: relationId,
//             corpusId: corpusId,
//             shareType: ShareResourceType.square,
//             shareRelationId: [category.id],
//           ));
//       Toast.hideLoading();
//       Toast.showSuccess('分享成功');
//     } catch (e) {
//       Toast.hideLoading();
//       Toast.showError(formatError(e));
//     }
//   }

//   static void shareToGroup(
//     BuildContext context,
//     WidgetRef ref, {
//     required ResourceType type,
//     required String relationId,
//     required String corpusId,
//   }) async {
//     context.pushPage(LearnGroupSelectorPage(
//       onSelected: (value) async {
//         Toast.showLoading();
//         try {
//           await ref.read(apiClientProvider).shareResource(ShareResourceParams(
//                 type: type,
//                 relationId: relationId,
//                 corpusId: corpusId,
//                 shareType: ShareResourceType.group,
//                 shareRelationId: value.map((e) => e.id).toList(),
//               ));
//           Toast.hideLoading();
//           Toast.showSuccess('分享成功');
//           Navigator.of(context).pop();
//         } catch (e) {
//           Toast.hideLoading();
//           Toast.showError(formatError(e));
//         }
//       },
//     ));
//   }

//   static void shareToTeacher(
//     BuildContext context,
//     WidgetRef ref, {
//     required ResourceType type,
//     required String relationId,
//     required String corpusId,
//   }) async {
//     context.pushPage(TeacherSelectorPage(
//       onSelected: (value) async {
//         Toast.showLoading();
//         try {
//           await ref.read(apiClientProvider).shareResource(ShareResourceParams(
//                 type: type,
//                 relationId: relationId,
//                 corpusId: corpusId,
//                 shareType: ShareResourceType.teacher,
//                 shareRelationId: value.map((e) => e.id).toList(),
//               ));
//           Toast.hideLoading();
//           Toast.showSuccess('分享成功');
//           Navigator.of(context).pop();
//         } catch (e) {
//           Toast.hideLoading();
//           Toast.showError(formatError(e));
//         }
//       },
//     ));
//   }
// }
