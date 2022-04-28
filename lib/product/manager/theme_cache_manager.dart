import 'abstract/i_cache_manager.dart';

enum ThemeKey { themedb, theme }

class ThemeCacheManager extends ICacheManager<bool> {
  static ThemeCacheManager? _instance;
  ThemeCacheManager._() : super(ThemeKey.themedb.name);
  static ThemeCacheManager get instance => _instance ??= ThemeCacheManager._();

  @override
  Future<void> init({String? key}) async {
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
