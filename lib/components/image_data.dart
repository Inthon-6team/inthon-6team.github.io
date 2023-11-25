import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageData extends StatelessWidget {
  String icon;
  final double? width;
  final double? height;
  final bool isSvg;

  ImageData(
    this.icon, {
    Key? key,
    this.width = 26,
    this.height = 26,
    this.isSvg = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isSvg) {
      return SvgPicture.asset(
        icon, // SVG 파일 경로
        width: width,
        height: height,
      );
    } else {
      return Image.asset(
        icon, // 이미지 파일 경로
        width: width,
        height: height,
      );
    }
  }
}

class IconsPath {
  static String get family1 => 'assets/images/family1.png';
  static String get click => 'assets/svg/click.svg';

  static String get googlelogo => 'assets/images/google_logo.png';
}
