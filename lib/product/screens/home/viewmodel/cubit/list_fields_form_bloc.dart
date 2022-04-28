import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../constants/components/app_components_constants.dart';
import '../../../../constants/model/model_constants.dart';
import '../../../../mixins/list_field_form_bloc_mixin.dart';
import '../../model/coin_model.dart';

class ListFieldFormBloc extends FormBloc<String, String> with ListFieldFormBlocMixin {
  ListFieldFormBloc() {
    addFieldBlocs(fieldBlocs: [nameField, costField, members]);
    addMember();
  }

  @override
  CoinCostModel onSubmitting() {
    CoinCostModel coinCostModel = CoinCostModel.fromJson(state.toJson());
    submit();
    return calculateCost(coinCostModel: coinCostModel);
  }
}

class ListFieldFormBlocEdit extends FormBloc<String, String> with ListFieldFormBlocMixin {
  ListFieldFormBlocEdit({required CoinCostModel coinCostModel}) {
    nameField.updateInitialValue(coinCostModel.coinName ?? "");
    costField.updateInitialValue(coinCostModel.coinCost ?? "");
    ModelConstants _modelConstants = ModelConstants.instance;

    members = ListFieldBloc<CoinFieldBloc, dynamic>(
      name: _modelConstants.coins,
      fieldBlocs: List.generate(
        coinCostModel.coins!.length,
        (index) {
          Coin? coin = coinCostModel.coins?[index];
          return CoinFieldBloc(
            name: _modelConstants.coin,
            coinPrice: TextFieldBloc(name: _modelConstants.coinPrice, initialValue: coin?.coinPrice ?? kZero.toString()),
            numberOfCoins: TextFieldBloc(name: _modelConstants.numberOfCoin, initialValue: coin?.numberOfCoin ?? kZero.toString()),
          );
        },
      ),
    );

    addFieldBlocs(fieldBlocs: [nameField, costField, members]);
  }

  @override
  CoinCostModel? onSubmitting() {
    CoinCostModel coinCost = CoinCostModel.fromJson(state.toJson());

    emitSuccess(canSubmitAgain: true);
    print("IS VALID ${state.isValid()}");
    return calculateCost(coinCostModel: coinCost);
  }
}
