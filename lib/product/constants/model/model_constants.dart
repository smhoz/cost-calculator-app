class ModelConstants {
  static ModelConstants? _instance;
  ModelConstants._();
  static ModelConstants get instance => _instance ?? ModelConstants._();

  String coins = "coins";
  String coin = "coin";
  String coinName = "coinName";
  String coinCost = "coinCost";
  String coinPrice = "coinPrice";
  String numberOfCoin = "numberOfCoin";
}
