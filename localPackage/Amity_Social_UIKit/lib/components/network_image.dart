import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({
    Key? key,
    required this.url,
    this.boxFit = BoxFit.contain,
    this.width,
    this.height,
  }) : super(key: key);

  final String url;
  final double? height;
  final double? width;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      memCacheWidth: 400,
      height: height,
      width: width,
      imageUrl: url,
      fit: boxFit,
      placeholder: (context, url) => const CupertinoActivityIndicator(
          animating: true, color: Colors.black),
      errorWidget: (context, url, e) {
        return Icon(
          Icons.person,
          color: Colors.white,
        );
      },
    );
  }
}
