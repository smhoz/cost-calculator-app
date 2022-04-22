import 'package:flutter/cupertino.dart';

enum SelectedTab {
  home,
  bookmark,
}

class TabViewModel extends ChangeNotifier {
  SelectedTab _selectedTab = SelectedTab.home;
  SelectedTab get selectedTab => _selectedTab;

  changeTab(SelectedTab tab) {
    _selectedTab = tab;
    notifyListeners();
  }
}
