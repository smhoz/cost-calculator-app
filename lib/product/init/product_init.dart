import 'package:hive_flutter/adapters.dart';
import 'package:provider/single_child_widget.dart';

import '../manager/coin_cost_cache_manager.dart';
import '../manager/theme_cache_manager.dart';
import 'notifier/provider_lists.dart';

class ProductInit {
  static ProductInit? _instance;
  ProductInit._();
  static ProductInit get instance => _instance ??= ProductInit._();

  List<SingleChildWidget>  providerLists = ProviderLists.instance.providerLists();

  Future<void> mainInit() async {
    await Hive.initFlutter();
    await ThemeCacheManager.instance.init();
    await CoinCostCacheManager.instance.init();
  }
}
