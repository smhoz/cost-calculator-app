import 'i_cache_manager.dart';

enum RememberChoiceCacheKey { rememberChoiceDB, rememberChoice }

class RememberChoiceCacheManager extends ICacheManager<bool> {
  static RememberChoiceCacheManager? _instance;
  RememberChoiceCacheManager._() : super(RememberChoiceCacheKey.rememberChoiceDB.name);
  static RememberChoiceCacheManager get instance => _instance ?? RememberChoiceCacheManager._();

  @override
  Future<void> deleteItem(String key) async {
    await box?.delete(key);
  }

  @override
  Future<void> deleteAtItem(int index) async {
    box?.deleteAt(index);
  }

  @override
  bool get(String key) {
    return box?.get(key, defaultValue: false) ?? false;
  }

  @override
  List<bool>? getItems() {
    return box?.values.toList();
  }

  @override
  void putItem(String key, bool value) {
    box?.put(key, value);
  }
}
