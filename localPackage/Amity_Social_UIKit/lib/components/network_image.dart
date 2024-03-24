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
    this.isShowIcon = true,
    this.loaderColor,
  }) : super(key: key);

  final String url;
  final double? height;
  final double? width;
  final BoxFit boxFit;
  final bool isShowIcon;
  final Color? loaderColor;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      memCacheWidth: 400,
      height: height,
      width: width,
      imageUrl: url,
      fit: boxFit,
      placeholder: (context, url) => CupertinoActivityIndicator(
          animating: true, color: loaderColor ?? Colors.black),
      errorWidget: (context, url, e) {
        return isShowIcon
            ? const Icon(
                Icons.person,
                color: Colors.white,
              )
            : Image.asset(
                'assets/images/IMG_5637.JPG',
                package: 'amity_uikit_beta_service',
              );
      },
    );
  }
}
