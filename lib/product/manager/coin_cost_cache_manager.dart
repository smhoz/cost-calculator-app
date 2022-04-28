import 'package:hive_flutter/hive_flutter.dart';

import '../constants/local_storage/hive_constants.dart';
import '../screens/home/model/coin_model.dart';
import 'abstract/i_cache_manager.dart';

enum CoinCostManagerKey { coincostdb, coincostkey }

class CoinCostCacheManager extends ICacheManager<CoinCostModel> {
  static CoinCostCacheManager? _instance;
  CoinCostCacheManager._() : super(CoinCostManagerKey.coincostdb.name);
  static CoinCostCacheManager get instance => _instance ??= CoinCostCacheManager._();
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
