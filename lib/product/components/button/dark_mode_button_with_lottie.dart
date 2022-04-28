import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/notifier/theme_notifier.dart';
import '../../../core/constants/app_duration_constants.dart';
import '../../constants/assets/assets_constants.dart';
import '../../manager/theme_cache_manager.dart';

class DarkModeButtonWithLottie extends StatefulWidget {
  const DarkModeButtonWithLottie({Key? key}) : super(key: key);

  @override
  State<DarkModeButtonWithLottie> createState() => _DarkModeButtonWithLottieState();
}

class _DarkModeButtonWithLottieState extends State<DarkModeButtonWithLottie> with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: AppDuration.normalDuration());
    !ThemeCacheManager.instance.getIsTrue(ThemeKey.theme.name) ? animationController?.reverse() : animationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, viewModel, child) {
        return InkWell(
          onTap: () {
            bool isDark = ThemeCacheManager.instance.getIsTrue(ThemeKey.theme.name);

            _changeTheme(viewModel, isDark);

            isDark ? animationController?.reverse() : animationController?.forward();

            _savedLocalStorage(isDark);
          },
          child: AssetsAnimatedIcon.icon_animated_dark_mode.toWidget(animation: animationController),
        );
      },
    );
  }

  void _changeTheme(ThemeNotifier viewModel, bool isDark) {
    viewModel.changeTheme(isDark ? AppThemes.light : AppThemes.dark);
  }

  void _savedLocalStorage(bool isDark) {
    ThemeCacheManager.instance.putItem(ThemeKey.theme.name, !isDark);
  }
}
