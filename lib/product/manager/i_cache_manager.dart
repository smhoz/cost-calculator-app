import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

enum CacheKey { hiveKey }

abstract class ICacheManager<T> {
  final String? key;
  Box<T>? box;
  ICacheManager(this.key);
  Future<void> init() async {
    if (!(box?.isOpen ?? false)) {
      box = await Hive.openBox(key ?? CacheKey.hiveKey.name);
    }
  }

  void putItem(String key, T value);
  List<T>? getItems();
  void registerAdapter() {}
  Future<void> deleteItem(String key);
  Future<void> deleteAtItem(int index);
  T? get(String key);
  void clear(String key) {
    box?.clear();
  }

  ValueListenable<Box<T>> listenable() {
    return Hive.box<T>(key!).listenable();
  }
}
