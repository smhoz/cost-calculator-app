import 'abstract/i_cache_manager.dart';

enum RememberChoiceCacheKey { rememberchoicedb, rememberchoicekey }

class RememberChoiceCacheManager extends ICacheManager<bool> {
  static RememberChoiceCacheManager? _instance;
  RememberChoiceCacheManager._() : super(RememberChoiceCacheKey.rememberchoicedb.name);
  static RememberChoiceCacheManager get instance => _instance ??= RememberChoiceCacheManager._();

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
    final value = box?.get(key, defaultValue: false);
    return value ?? false;
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
