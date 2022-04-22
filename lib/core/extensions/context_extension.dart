import 'package:flutter/material.dart';

import '../constants/app_duration_constants.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double dynamicHeight(double value) => height * value;
  double dynamicWidth(double value) => width * value;

  double get veryLowHeight => height * 0.005;
  double get lowHeight => height * 0.01;
  double get mediumHeight => height * 0.02;
  double get highHeight => height * 0.04;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get themeColor => Theme.of(this).colorScheme;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingVeryLow => EdgeInsets.all(veryLowHeight);
  EdgeInsets get paddingLow => EdgeInsets.all(lowHeight);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumHeight);
  EdgeInsets get paddingHigh => EdgeInsets.all(highHeight);

  EdgeInsets get paddingHorizontalMedium => EdgeInsets.symmetric(horizontal: mediumHeight);
  EdgeInsets get paddingVerticalMedium => EdgeInsets.symmetric(vertical: lowHeight);
  EdgeInsets get paddingLowVerticalAndhighHeightHorizontal => EdgeInsets.symmetric(vertical: mediumHeight, horizontal: highHeight);
  EdgeInsets get onlyRightPaddingLow => EdgeInsets.only(right: lowHeight);
  EdgeInsets get onlyTopPaddingLow => EdgeInsets.only(top: lowHeight);
  EdgeInsets get paddingLowVerticalAndMediumHorizontal => EdgeInsets.symmetric(vertical: lowHeight, horizontal: mediumHeight);
  EdgeInsets get symetricPadding => EdgeInsets.symmetric(vertical: lowHeight, horizontal: mediumHeight);
}

extension ShowDialog on BuildContext {
  void showAnimationDialog({
    Widget? child,
  }) {
    showGeneralDialog(
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(scale: a1.value, child: Opacity(opacity: a1.value, child: child));
      },
      transitionDuration: AppDuration.veryLowDuration(),
      barrierDismissible: true,
      barrierLabel: '',
      context: this,
      pageBuilder: (context, animation1, animation2) => const SizedBox.shrink(),
    );
  }
}

extension Navigation on BuildContext {
  NavigatorState get _navigator => Navigator.of(this);
  void pop() {
    _navigator.pop();
  }

  void navigateToPage(Widget page) {
    _navigator.push(MaterialPageRoute(builder: (context) => page));
  }

  void naviateToPagePushReplacement(Widget page) {
    _navigator.pushReplacement(MaterialPageRoute(builder: (context) => page));
  }
}
