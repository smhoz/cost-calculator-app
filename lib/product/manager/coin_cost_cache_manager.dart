import 'package:hive_flutter/hive_flutter.dart';

import '../constants/hive_constants.dart';
import '../screens/home/model/coin_model.dart';
import 'i_cache_manager.dart';

enum CoinCostManagerKey { coinCostDb }

class CoinCostCacheManager extends ICacheManager<CoinCostModel> {
  CoinCostCacheManager({String? key}) : super(key);
  @override
  Future<void> init() async {
    registerAdapter();

    await super.init();
  }

  @override
  void putItem(String key, CoinCostModel? value) async {
    await box?.put(key, value ?? CoinCostModel());
  }

  @override
  List<CoinCostModel>? getItems() {
    return box?.values.toList();
  }

  @override
  CoinCostModel? get(String key) {
    return box?.get(key);
  }

  @override
  Future<void> deleteItem(String key) async {
    await box?.delete(key);
  }

  @override
  Future<void> deleteAtItem(int index) async {
    box?.deleteAt(index);
  }

  @override
  void registerAdapter() {
    if (!Hive.isAdapterRegistered(HiveConstants.coinCostTypeId) && !Hive.isAdapterRegistered(HiveConstants.coinTypeId)) {
      Hive.registerAdapter(CoinCostModelAdapter());
      Hive.registerAdapter(CoinAdapter());
    }
  }
}
