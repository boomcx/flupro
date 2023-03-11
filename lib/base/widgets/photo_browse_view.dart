import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../app.dart';

class PhotoBrowseView extends StatelessWidget {
  const PhotoBrowseView({
    Key? key,
    required this.images,
    this.tags = const [],
    this.index,
  }) : super(key: key);

  final List<dynamic> images;
  final List<String> tags;
  final int? index;

  void show(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: kSystemUiOverlayStyleDark,
        child: PhotoViewGallery.builder(
          itemCount: images.length,
          pageController:
              index != null ? PageController(initialPage: index!) : null,
          builder: (context, index) {
            final image = images[index];
            ImageProvider? provider;
            if (image is String) {
              if (image.startsWith('http')) {
                provider = CachedNetworkImageProvider(image);
              } else {
                provider = FileImage(File(image));
              }
            } 
            // else if (image is ServiceFile) {
              // provider = CachedNetworkImageProvider(image.url);
            // }

            return PhotoViewGalleryPageOptions(
              imageProvider: provider,
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 1.1,
              heroAttributes: tags.length > index
                  ? PhotoViewHeroAttributes(
                      tag: tags[index],
                    )
                  : null,
            );
          },
        ),
      ),
    );
  }
}
