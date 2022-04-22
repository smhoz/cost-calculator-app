import 'package:flutter/material.dart';

import '../../../../core/constants/app_duration_constants.dart';
import '../../../constants/components/app_components_constants.dart';
import '../../../manager/coin_cost_cache_manager.dart';
import '../model/coin_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<CoinCostModel>? savedCoinCosts;

  late final CoinCostCacheManager? coinCostCacheManager;

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  HomeViewModel() {
    coinCostCacheManager = CoinCostCacheManager(key: CoinCostManagerKey.coinCostDb.name);
    coinCostCacheManager?.init().then((value) => getItems());
  }

  void getItems() {
    savedCoinCosts = coinCostCacheManager?.getItems() ?? [];
    notifyListeners();
  }

  void putItem(String key, CoinCostModel? model) async {
    coinCostCacheManager?.putItem(key, model);
    getItems();
  }

  Future<void> removeItem(String key) async {
    await coinCostCacheManager?.deleteItem(key);
    getItems();
  }

  void addAnimatedList() {
    listKey.currentState?.insertItem(kZero.toInt(), duration: AppDuration.longDuration());
  }

  void removeAnimatedList(int index) {
    listKey.currentState?.removeItem(index, (context, animation) => const SizedBox.shrink());
  }
}
