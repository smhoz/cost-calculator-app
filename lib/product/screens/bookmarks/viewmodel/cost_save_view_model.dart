import 'package:flutter/material.dart';

import '../../../manager/abstract/i_cache_manager.dart';

class CostSaveViewModel extends ChangeNotifier {
  List<T> getItems<T>(ICacheManager<T> cacheManager) {
    return cacheManager.getItems() ?? [];
  }

  void putItem<T>(ICacheManager<T> cacheManager, String key, T model) async {
    cacheManager.putItem(key, model);
    notifyListeners();
  }

  Future<void> removeItem<T>(ICacheManager<T> cacheManager, String key) async {
    await cacheManager.deleteItem(key);
    notifyListeners();
  }

  T? get<T>(ICacheManager<T> cacheManager, String key) {
    return cacheManager.get(key);
  }
}
