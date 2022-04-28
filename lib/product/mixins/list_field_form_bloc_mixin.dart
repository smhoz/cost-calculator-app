import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../core/extensions/string_extension.dart';
import '../constants/components/app_components_constants.dart';
import '../constants/model/model_constants.dart';
import '../screens/home/model/coin_model.dart';

mixin ListFieldFormBlocMixin {
  TextFieldBloc nameField = TextFieldBloc(name: ModelConstants.instance.coinName, validators: [FieldBlocValidators.required]);
  TextFieldBloc costField =
      TextFieldBloc(name: ModelConstants.instance.coinCost, initialValue: kZero.toString(), validators: [FieldBlocValidators.required]);
  ListFieldBloc<CoinFieldBloc, dynamic> members = ListFieldBloc<CoinFieldBloc, dynamic>(name: ModelConstants.instance.coins);

  void addMember() {
    ModelConstants _modelConstants = ModelConstants.instance;
    TextFieldBloc coinPriceField = TextFieldBloc(name: _modelConstants.coinPrice);
    TextFieldBloc numberOfCoinsField = TextFieldBloc(name: _modelConstants.numberOfCoin);

    members.addFieldBloc(
      CoinFieldBloc(
        name: _modelConstants.coin,
        coinPrice: coinPriceField,
        numberOfCoins: numberOfCoinsField,
      ),
    );
  }

  void removeMember(int index) {
    members.removeFieldBlocAt(index);
  }

  CoinCostModel calculateCost({CoinCostModel? coinCostModel}) {
    double totalAmountPaid = 0;
    double totalNumberOfCoins = 0;

    coinCostModel?.coins?.forEach(((element) {
      totalAmountPaid += double.parse(element.coinPrice!) * double.parse(element.numberOfCoin!);
      totalNumberOfCoins += double.parse(element.numberOfCoin!);
    }));

    final result = totalAmountPaid / totalNumberOfCoins;

    costField.updateInitialValue(result.toString().doubleAsFixed);

    coinCostModel = coinCostModel!.copyWith(
      coinCost: result.toString().doubleAsFixed,
      totalAmountPaid: totalAmountPaid.toString(),
      totalNumberOfCoins: totalNumberOfCoins.toString(),
    );

    return coinCostModel;
  }
}
