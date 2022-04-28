import 'package:cost_calculator_app/product/manager/theme_cache_manager.dart';
import 'package:cost_calculator_app/product/manager/coin_cost_cache_manager.dart';
import 'package:cost_calculator_app/product/manager/remember_choice_cache_manager.dart';
import 'package:cost_calculator_app/product/screens/bookmarks/viewmodel/cost_save_view_model.dart';
import 'package:cost_calculator_app/product/screens/home/model/coin_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  setUp(() async {
    await Hive.initFlutter();
    await RememberChoiceCacheManager.instance.init();
    await CoinCostCacheManager.instance.init();
    await ThemeCacheManager.instance.init();
  });
  group("Coin Cost Cache Manager Test", () {
    CostSaveViewModel costSaveViewModel = CostSaveViewModel();
    CoinCostModel coinCostModel = CoinCostModel(coinName: "BTC", id: "1");
    test('Coin Cost Cache Manager Put', () async {
      costSaveViewModel.putItem<CoinCostModel>(CoinCostCacheManager.instance, CoinCostManagerKey.coincostkey.name, coinCostModel);

      expect(CoinCostCacheManager.instance.box?.isNotEmpty, true);
    });
    test('Coin Cost Cache Manager Get', () async {
      final coinCostList = costSaveViewModel.getItems<CoinCostModel>(CoinCostCacheManager.instance);
      expect(coinCostList.first.coinName, "BTC");
    });

    test('Coin Cost Cache Manager Remove', () async {
      costSaveViewModel.removeItem<CoinCostModel>(CoinCostCacheManager.instance, coinCostModel.id ?? "");
      expect(CoinCostCacheManager.instance.box?.containsKey("1"), false);
    });
  });

  group("Remember Choice Cache Manager Test", () {
    CostSaveViewModel costSaveViewModel = CostSaveViewModel();
    String rememberChoiceCacheKey = RememberChoiceCacheKey.rememberchoicekey.name;
    test('Remember Choice Cache Manager Put', () async {
      costSaveViewModel.putItem<bool>(RememberChoiceCacheManager.instance, rememberChoiceCacheKey, true);

      expect(CoinCostCacheManager.instance.box?.isNotEmpty, true);
    });
    test('Remember Choice Cache Manager Get', () async {
      final value = costSaveViewModel.get<bool>(RememberChoiceCacheManager.instance, rememberChoiceCacheKey);

      expect(value, true);
    });

    test('Remember Choice Cache Manager Remove', () async {
      costSaveViewModel.removeItem<bool>(RememberChoiceCacheManager.instance, rememberChoiceCacheKey);

      expect(CoinCostCacheManager.instance.box?.containsKey(rememberChoiceCacheKey), false);
    });
  });

  group("Change Theme Cache Manager Test", () {
    CostSaveViewModel costSaveViewModel = CostSaveViewModel();
    String changeThemeCacheManagerKey = ThemeKey.theme.name;
    test('Change Theme Cache Manager Put', () async {
      costSaveViewModel.putItem<bool>(ThemeCacheManager.instance, changeThemeCacheManagerKey, true);

      expect(CoinCostCacheManager.instance.box?.isNotEmpty, true);
    });
    test('Change Theme Cache Manager Get', () async {
      final value = costSaveViewModel.get<bool>(ThemeCacheManager.instance, changeThemeCacheManagerKey);

      expect(value, true);
    });

    test('Change Theme Cache Manager Remove', () async {
      costSaveViewModel.removeItem<bool>(ThemeCacheManager.instance, changeThemeCacheManagerKey);

      expect(CoinCostCacheManager.instance.box?.containsKey(changeThemeCacheManagerKey), false);
    });
  });
}
