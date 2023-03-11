// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:ffmpeg_kit_flutter_full/ffmpeg_kit.dart';
// import 'package:ffmpeg_kit_flutter_full/ffprobe_kit.dart';
// import 'package:ffmpeg_kit_flutter_full/return_code.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// // import 'package:flutter_qcloudcos_transfer/qcloudcos_transfer.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:photo_picker/photo_picker.dart'; 
// import 'package:uuid/uuid.dart';

// /// 获取腾讯云上传参数，并缓存
// Future<QCloudCosTempSercet> getQCloudCosTempSecret(ApiClient apiClient) async {
//   final box = Hive.box('app');
//   const key = 'qcloud_temp_secret';
//   final value = box.get(key) as String?;
//   if (value != null) {
//     final jsonValue = jsonDecode(value);
//     final sercet = QCloudCosTempSercet.fromJson(jsonValue);
//     if ((sercet.expiredTime - 60) >
//         DateTime.now().millisecondsSinceEpoch / 1000) {
//       log('从缓存获取到上传参数');
//       return sercet;
//     }
//   }
//   log('上传参数过期了，从服务器获取');
//   final sercet = await apiClient.getQCloudCosTempSecret();
//   box.put(key, jsonEncode(sercet.toJson()));
//   return sercet;
// }

// /// 上传文件到腾讯云
// Future<String> uploadFile(
//   ApiClient apiClient, {
//   required String filePath,
// }) async {
//   // final secret = await getQCloudCosTempSecret(apiClient);
//   // final temp = secret.toJson();
//   // final extName = filePath.split('.').last;
//   // temp['fileName'] = '${const Uuid().v1()}.$extName';
//   // temp['filePath'] = filePath;
//   // QCloudCosTransfer.initialize(QCloudCosInitOptions(regionName: secret.region));
//   // final result =
//   //     await QCloudCosTransfer.update(QCloudCosUpdateOptions.decode(temp));
//   // return result.path;
//   return Future.value('');
// }

// Future<String?> pickVideo(
//   BuildContext context, {
//   SystemUiOverlayStyle? systemOverlayStyle,
// }) async {
//   context.dismissKeyboard();
//   final result = await const SheetDialog(sheets: [
//     '从相册选择',
//     '从文件选择',
//   ]).show(context);
//   if (result == null) return null;
//   if (result == 0) {
//     final picker = PhotoPicker();
//     final result = await picker.pickPhoto(PhotoPickerOptions(
//       type: PhotoPickerType.video,
//       maxAssetsCount: 1,
//       allowEdit: false,
//     ));
//     SystemChrome.setSystemUIOverlayStyle(
//         systemOverlayStyle ?? kSystemUiOverlayStyle);
//     if (result.assets.isEmpty) return null;
//     return result.assets.first.filePath;
//   } else if (result == 1) {
//     final file = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['mp4', 'avi', 'flv'],
//     );
//     if (file == null && file!.files.isEmpty) return null;
//     return file.files.first.path;
//   }
//   return null;
// }

// Future<String?> pickImageFromAlbum(
//   BuildContext context, {
//   SystemUiOverlayStyle? systemOverlayStyle,
//   bool allowEdit = false,
//   int photoEditCustomRatioW = 0,
//   int photoEditCustomRatioH = 0,
// }) async {
//   context.dismissKeyboard();
//   final picker = PhotoPicker();
//   final result = await picker.pickPhoto(PhotoPickerOptions(
//     type: PhotoPickerType.image,
//     maxAssetsCount: 1,
//     allowEdit: allowEdit,
//     photoEditCustomRatioW: photoEditCustomRatioW,
//     photoEditCustomRatioH: photoEditCustomRatioH,
//   ));
//   SystemChrome.setSystemUIOverlayStyle(
//       systemOverlayStyle ?? kSystemUiOverlayStyle);
//   if (result.assets.isEmpty) return null;
//   return result.assets.first.filePath;
// }

// Future<String?> pickImage(
//   BuildContext context, {
//   SystemUiOverlayStyle? systemOverlayStyle,
// }) async {
//   context.dismissKeyboard();
//   final result = await const SheetDialog(sheets: [
//     '从相册选择',
//     '从文件选择',
//   ]).show(context);
//   if (result == null) return null;
//   if (result == 0) {
//     return pickImageFromAlbum(
//       context,
//       systemOverlayStyle: systemOverlayStyle,
//     );
//   } else if (result == 1) {
//     final file = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//     );
//     if (file == null && file!.files.isEmpty) return null;
//     return file.files.first.path;
//   }
//   return null;
// }

// Future<String?> pickAudio() async {
//   final file = await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowedExtensions: ['mp3', 'wav'],
//   );
//   if (file == null && file!.files.isEmpty) return null;
//   return file.files.first.path;
// }

// Future<String?> pickDocumentationFile(BuildContext context) async {
//   final file = await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowedExtensions: AttachmentType.values.map((e) => e.name).toList(),
//   );
//   if (file == null && file!.files.isEmpty) return null;
//   return file.files.first.path;
// }

// /// 判断文件是否mp4
// Future<bool> isMp4(String path) async {
//   final session = await FFprobeKit.getMediaInformation(path);
//   final info = session.getMediaInformation();
//   if (info == null) return false;
//   final streams = info.getStreams();
//   final index = streams.indexWhere((e) => e.getType() == 'video');
//   if (index == -1) return false;
//   return streams[index].getCodec() == 'h264';
// }

// Future<void> formatMp4(String path, String savePath) async {
//   final session = await FFmpegKit.execute('-i $path -c:v mpeg4 $savePath');
//   final returnCode = await session.getReturnCode();
//   if (!ReturnCode.isSuccess(returnCode)) {
//     DebugDialog.show((await session.getAllLogsAsString()) ?? '');
//     throw AppError(AppErrorCode.mediaDecodingFailed);
//   }
// }

// /// 判断文件是否mp3
// Future<bool> isMp3(String path) async {
//   final session = await FFprobeKit.getMediaInformation(path);
//   final info = session.getMediaInformation();
//   if (info == null) return false;
//   final streams = info.getStreams();
//   if (streams.isEmpty || streams.length > 1) return false;
//   return streams.first.getCodec() == 'mp3';
// }

// Future<void> formatMp3(String path, String savePath) async {
//   final session =
//       await FFmpegKit.execute('-i $path -acodec libmp3lame $savePath');
//   final returnCode = await session.getReturnCode();
//   if (!ReturnCode.isSuccess(returnCode)) {
//     DebugDialog.show((await session.getAllLogsAsString()) ?? '');
//     throw AppError(AppErrorCode.mediaDecodingFailed);
//   }
// }

// Future<Duration> getMediaDuration(String path) async {
//   final session = await FFprobeKit.getMediaInformation(path);
//   final info = session.getMediaInformation();
//   if (info == null) return Duration.zero;
//   final streams = info.getStreams();
//   if (streams.isEmpty) return Duration.zero;
//   final seconds = double.tryParse(streams.first.getProperty('duration')) ?? 0;
//   return Duration(milliseconds: (seconds * 1000).toInt());
// }

// Future<void> clipMeida(
//   String path, {
//   required Duration duration,
// }) async {
//   final dir = (await getApplicationDocumentsDirectory()).path;
//   final extension = path.split('.').last;
//   final name = '${const Uuid().v1().toString()}.$extension';
//   final savePath = '$dir/$name';
//   final session = await FFmpegKit.execute('-i $path -t $duration $savePath');
//   final returnCode = await session.getReturnCode();
//   if (!ReturnCode.isSuccess(returnCode)) {
//     throw AppError(AppErrorCode.mediaProcessFailed);
//   }
//   final saveFile = File(savePath);
//   await saveFile.copy(path);
//   saveFile.delete();
// }

// /// 拼接视频
// Future<void> concatMeida(
//   List<String> paths, {
//   required String savePath,
// }) async {
//   String concatCmd = '';
//   for (var e in paths) {
//     if (concatCmd.isNotEmpty) concatCmd += ' ';
//     concatCmd += '-i $e';
//   }
//   concatCmd += ' -filter_complex \'';
//   for (int i = 0; i < paths.length; i++) {
//     concatCmd += '[$i:0] ';
//   }
//   concatCmd += 'concat=n=${paths.length}:v=0:a=1 [a]\' -map [a] $savePath';
//   final session = await FFmpegKit.execute(concatCmd);
//   final returnCode = await session.getReturnCode();
//   if (!ReturnCode.isSuccess(returnCode)) {
//     throw AppError(AppErrorCode.mediaProcessFailed);
//   }
// }

// Future<void> getEmptyMeida({
//   required Duration duration,
//   required String savePath,
// }) async {
//   final session =
//       await FFmpegKit.execute('-y -f lavfi -i anullsrc -t $duration $savePath');
//   final returnCode = await session.getReturnCode();
//   if (!ReturnCode.isSuccess(returnCode)) {
//     throw AppError(AppErrorCode.mediaProcessFailed);
//   }
// }

// String getFileType(String path) {
//   return path.split('/').last.split('.').last;
// }

// String getFileName(String path) {
//   return path.split('/').last.split('.').first;
// }
