import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/extensions/context_extension.dart';
import '../../constants/assets/assets_constants.dart';
import '../../screens/home/viewmodel/tab_view_model.dart';

class BottomBarIconButton extends StatelessWidget {
  final AssetsIcon assetsIcon;
  final VoidCallback? onPressed;
  final SelectedTab? currentTab;
  const BottomBarIconButton({Key? key, required this.assetsIcon, this.onPressed, this.currentTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: assetsIcon.toWidget(
            color: context.watch<TabViewModel>().selectedTab == currentTab ? context.themeColor.secondaryContainer : context.theme.disabledColor));
  }
}
