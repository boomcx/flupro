import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NetworkImageView extends StatelessWidget {
  const NetworkImageView({
    Key? key,
    required this.url,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.placeholder,
  }) : super(key: key);

  final String url;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) {
    Widget placeholder = this.placeholder ??
        Container(
          color: const Color(0xFFEEEEEE),
        );

    if (Uri.tryParse(url) == null) {
      return SizedBox(
        width: width,
        height: height,
        child: placeholder,
      );
    }

    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      width: width,
      height: height,
      placeholder: (context, url) => placeholder,
      errorWidget: (context, url, error) => placeholder,
    );
  }
}