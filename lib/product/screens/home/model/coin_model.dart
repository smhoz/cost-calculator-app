import 'package:flutter/cupertino.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hive/hive.dart';

import '../../../constants/local_storage/hive_constants.dart';
import '../../../constants/model/model_constants.dart';

part 'coin_model.g.dart';

class CoinFieldBloc extends GroupFieldBloc {
  final TextFieldBloc coinPrice;
  final TextFieldBloc numberOfCoins;

  CoinFieldBloc({
    required this.coinPrice,
    required this.numberOfCoins,
    String? name,
  }) : super(name: name, fieldBlocs: [
          coinPrice,
          numberOfCoins,
        ]);
}

@HiveType(typeId: HiveConstants.coinCostTypeId)
class CoinCostModel {
  @HiveField(0)
  String? coinName;
  @HiveField(1)
  String? coinCost;
  @HiveField(2)
  List<Coin>? coins;
  @HiveField(3)
  String? id;
  @HiveField(4)
  String? totalNumberOfCoins;
  @HiveField(5)
  String? totalAmountPaid;

  CoinCostModel({this.coinName, this.coins, this.coinCost, this.id, this.totalAmountPaid, this.totalNumberOfCoins});
  CoinCostModel.fromJson(Map<String, dynamic> json) {
    ModelConstants modelConstants = ModelConstants.instance;
    coinName = json[modelConstants.coinName];
    coinCost = json[modelConstants.coinCost];
    id = UniqueKey().toString();
    if (json[modelConstants.coins] != null) {
      coins = <Coin>[];
      json[modelConstants.coins].forEach((v) {
        coins!.add(Coin.fromJson(v));
      });
    }
  }

  CoinCostModel copyWith({String? coinName, String? coinCost, List<Coin>? coins, String? id, String? totalNumberOfCoins, String? totalAmountPaid}) {
    return CoinCostModel(
        coinName: coinName ?? this.coinName,
        coins: coins ?? this.coins,
        id: id ?? this.id,
        totalAmountPaid: totalAmountPaid ?? this.totalAmountPaid,
        totalNumberOfCoins: totalNumberOfCoins ?? this.totalNumberOfCoins,
        coinCost: coinCost ?? this.coinCost);
  }

  void updateCoinCost(String value) {
    coinCost = value;
  }

  void updateTotalNumberOfCoins(String value) {
    totalNumberOfCoins = value;
  }

  @override
  String toString() =>
      'ResultCoinModel(coinCost:$coinCost  coinName: $coinName, coins: $coins , id: $id , totalAmountPaid : $totalAmountPaid , totalNumberOfCoins : $totalNumberOfCoins)';
}

@HiveType(typeId: HiveConstants.coinTypeId)
class Coin {
  @HiveField(0)
  String? coinPrice;
  @HiveField(1)
  String? numberOfCoin;

  Coin({this.coinPrice, this.numberOfCoin});

  factory Coin.fromJson(Map<String, dynamic> json) {
    ModelConstants modelConstants = ModelConstants.instance;
    return Coin(coinPrice: json[modelConstants.coinPrice], numberOfCoin: json[modelConstants.numberOfCoin]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    ModelConstants modelConstants = ModelConstants.instance;
    data[modelConstants.coinPrice] = coinPrice;
    data[modelConstants.numberOfCoin] = numberOfCoin;
    return data;
  }

  @override
  String toString() => 'Coin(coinPrice: $coinPrice, numberOfCoin: $numberOfCoin)';
}
