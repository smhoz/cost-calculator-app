import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../../core/extensions/context_extension.dart';
import '../../../core/constants/app_sized_box.dart';
import '../../constants/components/app_components_constants.dart';
import '../form_field/header_text_and_form_field.dart';

class CoinCostAndNameField extends StatelessWidget {
  final TextFieldBloc<dynamic> coinNameFieldBloc;
  final TextFieldBloc<dynamic> coinCostFieldBloc;
  const CoinCostAndNameField({Key? key, required this.coinNameFieldBloc, required this.coinCostFieldBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _costValueField(context),
        const AppSizedBox.lowHeightSizedBox(),
        _nameField(context),
      ],
    );
  }

  HeaderTextAndFormField _costValueField(BuildContext context) {
    return HeaderTextAndFormField(
      textFieldBloc: coinCostFieldBloc,
      prefixIcon: Icon(Icons.attach_money_rounded, color: context.themeColor.primaryContainer),
      enabled: false,
      readOnly: true,
      formFieldStlye: context.textTheme.bodyText2,
      suffixIcon: _costValueText(context),
      suffixBoxConstraints: BoxConstraints(minWidth: kZero, minHeight: kZero),
    );
  }

  Padding _costValueText(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontalMedium,
      child: Text("Cost Value", style: context.textTheme.bodyText1?.copyWith(fontSize: context.textTheme.headline6?.fontSize)),
    );
  }

  HeaderTextAndFormField _nameField(BuildContext context) {
    return HeaderTextAndFormField(
      textFieldBloc: coinNameFieldBloc,
      headerText: "Name",
      textInputType: TextInputType.text,
      headerTextStyle: context.textTheme.bodyText1,
      prefixIcon: Icon(
        Icons.edit,
        color: context.themeColor.primaryContainer,
      ),
    );
  }
}
