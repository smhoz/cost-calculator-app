import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extension.dart';
import '../../../core/constants/app_border_radius.dart';
import '../../../core/constants/app_sized_box.dart';
import '../../constants/components/app_components_constants.dart';
import '../../screens/home/model/coin_model.dart';

class BookMarkCard extends StatelessWidget {
  final bool isOdd;

  final VoidCallback? editButtonOnPressed;
  final VoidCallback? onDissmissed;
  final CoinCostModel? coinCostModel;
  final double? width;

  const BookMarkCard({
    Key? key,
    this.isOdd = false,
    this.editButtonOnPressed,
    this.onDissmissed,
    this.width,
    this.coinCostModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.up,
      background: Container(
        padding: context.paddingLow,
        decoration: _boxDecoration(context),
        child: _dismissibleBackground(context),
      ),
      onDismissed: (direction) {
        if (onDissmissed != null) {
          onDissmissed!();
        }
      },
      child: SizedBox(
        width: width,
        child: Card(
          elevation: kZero,
          color: isOdd ? context.themeColor.primary : context.themeColor.secondary,
          shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.normalAllCircular()),
          child: Padding(
            padding: context.paddingMedium,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _balanceIconAndCoinName(context),
                Expanded(child: _totalPaidAndTotalNumber(context)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _coinCostAndEditButton(context),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: AppBorderRadius.normalAllCircular(),
      color: context.themeColor.error,
    );
  }

  Widget _dismissibleBackground(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Delete", style: context.textTheme.headline3?.copyWith(color: context.themeColor.onSecondary)),
        const AppSizedBox.normalHeightSizedBox(),
        Icon(
          Icons.delete,
          color: context.themeColor.onSecondary,
        ),
      ],
    );
  }

  Row _balanceIconAndCoinName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _balanceIcon(context),
        _numberText(context, coinCostModel?.coinName, textAlign: TextAlign.end),
      ],
    );
  }

  Icon _balanceIcon(BuildContext context) {
    return Icon(
      Icons.account_balance_wallet_rounded,
      color: isOdd ? context.themeColor.secondary : context.theme.disabledColor,
      size: 36,
    );
  }

  Widget _numberText(BuildContext context, String? text, {double? textOverFlowWidth, TextAlign? textAlign}) {
    return SizedBox(
      width: context.dynamicWidth(textOverFlowWidth ?? 0.2),
      child: Text(
        text ?? "",
        textAlign: textAlign ?? TextAlign.start,
        overflow: TextOverflow.clip,
        softWrap: false,
        style: context.textTheme.bodyText1?.copyWith(color: isOdd ? context.themeColor.secondary : context.themeColor.secondaryContainer),
      ),
    );
  }

  Column _totalPaidAndTotalNumber(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _totalPaid(context),
        _totalNumber(context),
      ],
    );
  }

  Column _totalNumber(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleText(context, "Total Number"),
        _numberText(context, "${coinCostModel?.totalNumberOfCoins}", textOverFlowWidth: 0.3),
      ],
    );
  }

  Column _totalPaid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleText(context, "Total Paid"),
        _numberText(context, "\$ ${coinCostModel?.totalAmountPaid}", textOverFlowWidth: 0.3),
      ],
    );
  }

  Text _titleText(BuildContext context, String? text) {
    return Text(
      text ?? "",
      style: context.textTheme.headline6?.copyWith(color: isOdd ? context.themeColor.secondary : context.themeColor.secondaryContainer),
    );
  }

  Row _coinCostAndEditButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _numberText(context, "\$ ${coinCostModel?.coinCost}"),
        Expanded(
          child: IconButton(
              onPressed: editButtonOnPressed,
              icon: Icon(
                Icons.edit,
                color: isOdd ? context.themeColor.secondary : context.themeColor.primaryContainer,
              )),
        )
      ],
    );
  }
}
