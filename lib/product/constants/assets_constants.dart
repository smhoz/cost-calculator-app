import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class AssetsConstants {
  AssetsConstants._();
  static AssetsConstants? _instance;

  static AssetsConstants get instance => _instance ??= AssetsConstants._();
}

enum AssetsIcon {
  icon_home,
  icon_bookmark,
}
enum AssetsAnimatedIcon { icon_animated_dark_mode }
enum AssetsSvg { image_background_waves }

extension AssetsIconExtension on AssetsIcon {
  String get path => "assets/icons/$name.png";

  Widget toWidget({Color? color}) => Image.asset(
        path,
        color: color,
      );
}

extension AssetsAnimatedIconExtension on AssetsAnimatedIcon {
  String get path => "assets/icons/$name.json";

  Widget toWidget({double? height = 32, double? width = 32, Animation<double>? animation}) {
    return Lottie.asset(path, height: height, width: width, controller: animation);
  }
}

extension AssetsSvgExtension on AssetsSvg {
  String get path => "assets/images/$name.svg";

  Widget toWidget({BoxFit? boxFit = BoxFit.contain, Color? color}) {
    return SvgPicture.asset(
      path,
      fit: boxFit!,
      color: color,
    );
  }
}
