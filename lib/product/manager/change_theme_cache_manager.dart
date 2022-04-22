import 'i_cache_manager.dart';

enum ThemeKey { themeDb, theme }

class ChangeThemeCacheManager extends ICacheManager<bool> {
  static ChangeThemeCacheManager? _instance;
  ChangeThemeCacheManager._() : super(ThemeKey.themeDb.name);
  static ChangeThemeCacheManager get instance => _instance ??= ChangeThemeCacheManager._();

  @override
  Future<void> init() async {
    await super.init();
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
  bool get(String key) {
    return box?.get(key, defaultValue: false) ?? false;
  }

  bool getIsTrue(String key) {
    return box?.get(key, defaultValue: false) == true;
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
