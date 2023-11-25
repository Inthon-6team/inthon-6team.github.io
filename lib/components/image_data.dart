import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageData extends StatelessWidget {
  String icon;
  final double? width;
  final bool isSvg;

  ImageData(
    this.icon, {
    Key? key,
    this.width = 26,
    this.isSvg = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isSvg) {
      return SvgPicture.asset(
        icon, // SVG 파일 경로
        width: width,
      );
    } else {
      return Image.asset(
        icon, // 이미지 파일 경로
        width: width,
      );
    }
  }
}

class IconsPath {
  //static String get total => 'assets/svg/total_time.svg';
}
