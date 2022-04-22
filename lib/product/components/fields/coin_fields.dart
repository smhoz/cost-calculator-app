import 'package:flutter/material.dart';

import '../../../core/constants/app_border_radius.dart';
import '../../../core/constants/app_sized_box.dart';
import '../../../core/extensions/context_extension.dart';
import '../../screens/home/model/coin_model.dart';
import '../form_field/header_text_and_form_field.dart';

class CostFields extends StatelessWidget {
  final CoinFieldBloc memberField;
  final VoidCallback onRemoveMember;
  const CostFields({Key? key, required this.memberField, required this.onRemoveMember}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        onRemoveMember.call();
      },
      background: Padding(
        padding: context.paddingVerticalMedium,
        child: Container(
          padding: context.paddingLow,
          decoration: _boxDecoration(context),
          child: _dismissibleBackground(context),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _totalNumberField(context),
          _amountPriceField(context),
        ],
      ),
    );
  }

  Row _dismissibleBackground(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.delete, color: context.themeColor.onSecondary),
        const AppSizedBox.lowWidthSizedBox(),
        Text("Delete", style: context.textTheme.headline3?.copyWith(color: context.themeColor.onSecondary))
      ],
    );
  }

  BoxDecoration _boxDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: AppBorderRadius.normalAllCircular(),
      color: context.themeColor.error,
    );
  }

  HeaderTextAndFormField _amountPriceField(BuildContext context) {
    return HeaderTextAndFormField(
      prefixIcon: Icon(Icons.attach_money_rounded, color: context.themeColor.primaryContainer),
      headerText: "Amount Price",
      formFieldWidth: context.dynamicWidth(0.42),
      textFieldBloc: memberField.coinPrice,
    );
  }

  HeaderTextAndFormField _totalNumberField(BuildContext context) {
    return HeaderTextAndFormField(
      textFieldBloc: memberField.numberOfCoins,
      headerText: "Total Number",
      formFieldWidth: context.dynamicWidth(0.42),
    );
  }
}
