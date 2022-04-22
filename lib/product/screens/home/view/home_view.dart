import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/circular_progress/center_adaptive_progress_indicator.dart';
import '../../../../core/constants/app_duration_constants.dart';
import '../../../../core/constants/app_sized_box.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../components/button/dark_mode_button_with_lottie.dart';
import '../../../components/button/save_button.dart';
import '../../../components/card/bookmarks_card.dart';
import '../../../components/fields/coin_cost_and_name_fields.dart';
import '../../../components/fields/dynamic_form_fields.dart';
import '../../../components/texts/not_found_saved_text.dart';
import '../../../constants/components/app_components_constants.dart';
import '../../bookmarks/view/bookmarks_view.dart';
import '../model/coin_model.dart';
import '../viewmodel/home_view_model.dart';
import '../viewmodel/list_fields_form_bloc.dart';

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
            _savedListConsumer(),
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

  Consumer<HomeViewModel> _savedListConsumer() {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.savedCoinCosts != null) {
          return viewModel.savedCoinCosts!.isEmpty ? const NotFoundSaved() : _savedList(context, viewModel);
        } else {
          return const AdaptiveCircularProgressIndicator();
        }
      },
    );
  }

  Widget _coinCostAndNameField(BuildContext context) {
    final formBloc = context.read<ListFieldFormBloc>();
    return CoinCostAndNameField(coinNameFieldBloc: formBloc.clubName, coinCostFieldBloc: formBloc.coinCost);
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

  SizedBox _savedList(BuildContext context, HomeViewModel viewModel) {
    return SizedBox(
      height: context.dynamicHeight(0.3),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.savedCoinCosts?.length,
        itemBuilder: (context, index) {
          bool isOdd = index % 2 != 0;
          CoinCostModel? coinCostModel = viewModel.savedCoinCosts?[index];

          return BookMarkCard(
            isOdd: isOdd,
            width: context.dynamicWidth(0.4),
            coinCostModel: coinCostModel,
            onDissmissed: () async => coinCostModel?.id != null ? await context.read<HomeViewModel>().removeItem(coinCostModel!.id!) : null,
            editButtonOnPressed: () => context.navigateToPage(BookMarksEdit(coinCostModel: coinCostModel)),
          );
        },
      ),
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
          context.read<HomeViewModel>().putItem(_model.id!, _model); // saved locale
        }
      },
    );
  }
}
