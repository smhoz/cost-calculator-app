import 'package:flutter/cupertino.dart';

class AppComponentConstants {
  static AppComponentConstants? _instance;
  AppComponentConstants._();

  static AppComponentConstants get instance => _instance ?? AppComponentConstants._();

  ScrollPhysics get scrollPhysics => const BouncingScrollPhysics();

  double fieldHeaderTextFontSize = 16;
  double gridViewSpacing = 8;
  int gridViewAxisCount = 2;

  Animation<Offset> listTweenAnimation(Animation<double> animation) {
    return Tween<Offset>(
      begin: Offset(kZero, kNegatifOne),
      end: Offset(kZero, kZero),
    ).animate(CurvedAnimation(parent: animation, curve: Curves.elasticOut, reverseCurve: Curves.bounceOut));
  }
}

double kZero = 0;
double kNegatifOne = -1;
