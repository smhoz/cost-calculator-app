import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_duration_constants.dart';
import '../../../../core/constants/app_sized_box.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../components/button/dark_mode_button_with_lottie.dart';
import '../../../components/button/save_button.dart';
import '../../../components/card/bookmarks_card.dart';
import '../../../components/fields/coin_cost_and_name_fields.dart';
import '../../../components/fields/dynamic_form_fields.dart';
import '../../../constants/components/app_components_constants.dart';
import '../../../manager/coin_cost_cache_manager.dart';
import '../../bookmarks/view/bookmarks_view.dart';
import '../../bookmarks/viewmodel/cost_save_view_model.dart';
import '../model/coin_model.dart';
import '../viewmodel/cubit/list_fields_form_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController? scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: AppComponentConstants.instance.scrollPhysics,
      child: Padding(
        padding: context.paddingMedium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appBar(context),
            const AppSizedBox.normalHeightSizedBox(),
            _savedList(),
            _coinCostAndNameField(context),
            _formFields(),
            _calculateAndSaveButton(context),
          ],
        ),
      ),
    );
  }

  Row _appBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Bookmarks", style: context.textTheme.headline1),
        const DarkModeButtonWithLottie(),
      ],
    );
  }

  Widget _savedList() {
    final saveList = context.watch<CostSaveViewModel>().getItems(CoinCostCacheManager.instance);
    return SizedBox(
      height: context.dynamicHeight(0.3),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: saveList.length,
        itemBuilder: (context, index) {
          bool isOdd = index % 2 != 0;
          CoinCostModel? coinCostModel = saveList[index];
          return BookMarkCard(
            isOdd: isOdd,
            width: context.dynamicWidth(0.4),
            coinCostModel: coinCostModel,
            onDissmissed: () async => coinCostModel.id != null
                ? await context.read<CostSaveViewModel>().removeItem(CoinCostCacheManager.instance, coinCostModel.id!)
                : null,
            editButtonOnPressed: () => context.navigateToPage(BookMarksEdit(coinCostModel: coinCostModel)),
          );
        },
      ),
    );
  }

  Widget _coinCostAndNameField(BuildContext context) {
    final formBloc = context.read<ListFieldFormBloc>();
    return CoinCostAndNameField(coinNameFieldBloc: formBloc.nameField, coinCostFieldBloc: formBloc.costField);
  }

  Widget _formFields() {
    final formBloc = context.read<ListFieldFormBloc>();
    return DynamicFormFields(
      bloc: formBloc.members,
      onRemoved: (index) {
        formBloc.removeMember(index);
      },
    );
  }

  TextElevatedSaveButton _calculateAndSaveButton(BuildContext context) {
    ListFieldFormBloc formBloc = context.read<ListFieldFormBloc>();

    return TextElevatedSaveButton(
      onPressed: (value) {
        scrollController?.animateTo(scrollController!.position.minScrollExtent, duration: AppDuration.lowDuration(), curve: Curves.easeIn);
        CoinCostModel? _model = formBloc.onSubmitting();
        if (value && _model.id != null) {
          // alert dialog on pressed ok button
          context.read<CostSaveViewModel>().putItem(CoinCostCacheManager.instance, _model.id!, _model); // saved locale
        }
      },
    );
  }
}
