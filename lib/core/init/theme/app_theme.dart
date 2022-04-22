import 'package:flutter/material.dart';

import '../../constants/app_border_radius.dart';

class AppTheme {
  static AppTheme? _instance;
  AppTheme._();
  static AppTheme get instance => _instance ??= AppTheme._();

  AppBarTheme appBarTheme = const AppBarTheme(color: Color.fromARGB(255, 208, 208, 211), elevation: 0);

  ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.normalAllCircular())));

  FloatingActionButtonThemeData floatingActionButtonThemeData = const FloatingActionButtonThemeData(backgroundColor: Color(0xFF3b3dbf));

  IconThemeData iconThemeData = const IconThemeData(size: 24, color: Color(0xFF3b3dbf));

  TextButtonThemeData get textButtonThemeData => TextButtonThemeData(style: ButtonStyle(textStyle: MaterialStateProperty.all(textTheme().headline4)));

  BottomNavigationBarThemeData bottomNavigationBarThemeData = const BottomNavigationBarThemeData(backgroundColor: Color(0xFFfafafd));

  Color lightThemesecondaryColor = Colors.white;
  Color lightThemeScaffoldBackgroundColor = const Color(0xFFeff0f4);
  Color lightThemeDisabledColor = Colors.grey.shade400;
  Color lightThemeSecondaryContainer = Colors.black;

  Color darkThemeDisabledColor = Colors.grey;
  Color darkThemeSecondaryColor = const Color(0xFF404040);

  Color primaryColor = const Color(0xFF7fc4dc);
  Color onSecondary = Colors.white;
  Color errorColor = Colors.red;
  Color primaryContainer = const Color(0xFF3b3dbf);

  Color blackColor = Colors.black;
  Color grey = Colors.grey;
  Color darkGrey = const Color(0xFF8e8d97);

  TextTheme textTheme({
    Color? headLine1Color,
    Color? headLine2Color,
    Color? headline3Color,
    Color? headline4Color,
    Color? headline6Color,
    Color? bodyText1Color,
    Color? bodyText2Color,
  }) {
    return TextTheme(
      headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: headLine1Color),
      headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: headLine2Color),
      headline3: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: headline3Color),
      headline4: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: headline4Color),
      headline6: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: headline6Color),
      bodyText1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: bodyText1Color),
      bodyText2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: bodyText2Color),
    );
  }

  TextTheme lightThemeTextTheme() {
    return textTheme(
      headLine1Color: grey,
      headline3Color: blackColor,
      headline4Color: grey,
      headline6Color: grey,
      bodyText1Color: darkGrey,
      bodyText2Color: blackColor,
    );
  }

  TextTheme darkThemeTextTheme() {
    return textTheme(headLine1Color: grey);
  }
}
