import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../components/button/bottom_bar_icon_button.dart';
import '../../../components/button/floationg_action_button_with_add_widget.dart';
import '../../../constants/assets_constants.dart';
import '../../bookmarks/view/bookmarks_view.dart';
import '../viewmodel/tab_view_model.dart';
import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: context.paddingLowVerticalAndhighHeightHorizontal,
          child: _tabIcons(context),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              _backgroundImage(context),
              _changeTabConsumer(),
            ],
          ),
        ));
  }

  Widget _backgroundImage(BuildContext context) {
    return AssetsSvg.image_background_waves.toWidget(boxFit: BoxFit.fitHeight, color: context.theme.appBarTheme.backgroundColor);
  }

  Row _tabIcons(BuildContext context) {
    final tabViewModel = context.read<TabViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _homeButton(tabViewModel),
        _floatingActionButton(context),
        _bookmarkButton(tabViewModel),
      ],
    );
  }

  BottomBarIconButton _homeButton(TabViewModel tabViewModel) {
    return BottomBarIconButton(
      assetsIcon: AssetsIcon.icon_home,
      onPressed: () => tabViewModel.changeTab(SelectedTab.home),
      currentTab: SelectedTab.home,
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return const FloatingActionButtonAddWiget();
  }

  BottomBarIconButton _bookmarkButton(TabViewModel tabViewModel) {
    return BottomBarIconButton(
      assetsIcon: AssetsIcon.icon_bookmark,
      onPressed: () => tabViewModel.changeTab(SelectedTab.bookmark),
      currentTab: SelectedTab.bookmark,
    );
  }

  Consumer<TabViewModel> _changeTabConsumer() {
    return Consumer<TabViewModel>(builder: (context, viewModel, child) {
      switch (viewModel.selectedTab) {
        case SelectedTab.home:
          return const HomeView();
        case SelectedTab.bookmark:
          return const BookMarksView();
      }
    });
  }
}
