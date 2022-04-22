import 'package:flutter/material.dart';

import '../../../../product/constants/app_constants.dart';
import '../app_theme.dart';

class AppThemeLight {
  static AppThemeLight? _instance;
  AppThemeLight._();
  static AppThemeLight get instance => _instance ??= AppThemeLight._();

  ThemeData get theme {
    AppTheme appTheme = AppTheme.instance;
    return ThemeData(
        fontFamily: AppConstant.fontFamily,
        appBarTheme: appTheme.appBarTheme,
        disabledColor: appTheme.lightThemeDisabledColor,
        elevatedButtonTheme: appTheme.elevatedButtonThemeData,
        iconTheme: appTheme.iconThemeData,
        scaffoldBackgroundColor: appTheme.lightThemeScaffoldBackgroundColor,
        textButtonTheme: appTheme.textButtonThemeData,
        bottomNavigationBarTheme: appTheme.bottomNavigationBarThemeData,
        floatingActionButtonTheme: AppTheme.instance.floatingActionButtonThemeData,
        colorScheme: ThemeData.light().colorScheme.copyWith(
            secondary: appTheme.lightThemesecondaryColor,
            onSecondary: appTheme.onSecondary,
            primary: appTheme.primaryColor,
            primaryContainer: appTheme.primaryContainer,
            secondaryContainer: appTheme.lightThemeSecondaryContainer,
            error: appTheme.errorColor),
        textTheme: appTheme.lightThemeTextTheme());
  }
}
