import 'package:flutter/material.dart';

import '../../../../product/constants/app/app_constants.dart';
import '../app_theme.dart';

class AppThemeDark {
  static AppThemeDark? _instance;
  AppThemeDark._();
  static AppThemeDark get instance => _instance ??= AppThemeDark._();

  ThemeData get theme {
    AppTheme appTheme = AppTheme.instance;
    return ThemeData(
        fontFamily: AppConstant.fontFamily,
        appBarTheme: appTheme.appBarTheme,
        disabledColor: appTheme.darkThemeDisabledColor,
        elevatedButtonTheme: appTheme.elevatedButtonThemeData,
        iconTheme: appTheme.iconThemeData,
        textButtonTheme: appTheme.textButtonThemeData,
        bottomNavigationBarTheme: appTheme.bottomNavigationBarThemeData,
        floatingActionButtonTheme: appTheme.floatingActionButtonThemeData,
        colorScheme: ThemeData.dark().colorScheme.copyWith(
              primary: appTheme.primaryColor,
              secondary: appTheme.darkThemeSecondaryColor,
              secondaryContainer: appTheme.onSecondary,
              onSecondary: appTheme.onSecondary,
              error: appTheme.errorColor,
            ),
        textTheme: appTheme.darkThemeTextTheme());
  }
}
