import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

enum CacheKey { hivekey }

abstract class ICacheManager<T> {
  final String? key;
  Box<T>? _box;
  Box<T>? get box => _box;
  ICacheManager(this.key);
  Future<void> init() async {
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key ?? CacheKey.hivekey.name);
    }
  }

  void putItem(String key, T value);
  List<T>? getItems();
  void registerAdapter() {}
  Future<void> deleteItem(String key);
  Future<void> deleteAtItem(int index);
  T? get(String key);
  void clear(String key) {
    _box?.clear();
  }

  ValueListenable<Box<T>> listenable() {
    return Hive.box<T>(key!).listenable();
  }
}
