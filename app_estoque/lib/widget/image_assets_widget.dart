import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageAsset extends StatelessWidget {
  final String img;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  const ImageAsset(
    this.img, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return img.contains(".svg")
        ? SvgPicture.asset(
            img,
            width: width,
            height: height,
            colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
            fit: fit ?? BoxFit.contain,
          )
        : Image.asset(
            img,
            width: width,
            height: height,
            color: color,
            fit: fit ?? BoxFit.contain,
          );
  }
}
