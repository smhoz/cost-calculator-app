import 'package:flutter/material.dart';

import '../init/theme/dark/dark_theme.dart';
import '../init/theme/light/light_theme.dart';

enum AppThemes { light, dark }

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  ThemeData get getTheme => _themeData;

  changeTheme(AppThemes themes) async {
    if (themes == AppThemes.dark) {
      _themeData = AppThemeDark.instance.theme;
    } else {
      _themeData = AppThemeLight.instance.theme;
    }
    notifyListeners();
  }
}
