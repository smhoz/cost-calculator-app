import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../components/button/save_button.dart';
import '../../../components/card/bookmarks_card.dart';
import '../../../components/fields/coin_cost_and_name_fields.dart';
import '../../../components/fields/dynamic_form_fields.dart';
import '../../../constants/components/app_components_constants.dart';
import '../../home/model/coin_model.dart';
import '../../home/viewmodel/home_view_model.dart';
import '../../home/viewmodel/list_fields_form_bloc.dart';

class BookMarksView extends StatefulWidget {
  const BookMarksView({Key? key}) : super(key: key);

  @override
  State<BookMarksView> createState() => _BookMarksViewState();
}

class _BookMarksViewState extends State<BookMarksView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bookMarksText(context),
        _consumerGridView(context),
      ],
    );
  }

  Padding _bookMarksText(BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: Text(
        "Bookmarks",
        style: context.textTheme.headline1,
      ),
    );
  }

  Widget _consumerGridView(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        return GridView.builder(
          shrinkWrap: true,
          padding: context.paddingLow,
          physics: AppComponentConstants.instance.scrollPhysics,
          itemCount: viewModel.savedCoinCosts?.length,
          itemBuilder: (context, index) {
            bool isOdd = index % 2 != 0;
            CoinCostModel? coinCostModel = context.read<HomeViewModel>().savedCoinCosts![index];
            return _bookMarkCard(isOdd, context, coinCostModel);
          },
          gridDelegate: _sliverGridDelegate(context),
        );
      },
    );
  }

  BookMarkCard _bookMarkCard(bool isOdd, BuildContext context, CoinCostModel coinCostModel) {
    return BookMarkCard(
      isOdd: isOdd,
      coinCostModel: coinCostModel,
      onDissmissed: () async => coinCostModel.id != null ? await context.read<HomeViewModel>().removeItem(coinCostModel.id!) : null,
      editButtonOnPressed: () => context.navigateToPage(BookMarksEdit(coinCostModel: coinCostModel)),
    );
  }
}

SliverGridDelegateWithFixedCrossAxisCount _sliverGridDelegate(BuildContext context) {
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: AppComponentConstants.instance.gridViewAxisCount,
    crossAxisSpacing: AppComponentConstants.instance.gridViewSpacing,
    mainAxisSpacing: AppComponentConstants.instance.gridViewSpacing,
    mainAxisExtent: context.dynamicHeight(0.35),
  );
}

class BookMarksEdit extends StatelessWidget {
  final CoinCostModel? coinCostModel;
  const BookMarksEdit({Key? key, required this.coinCostModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListFieldFormBlocEdit(coinCostModel: coinCostModel!),
      child: BookMarksEditView(
        coinCostModel: coinCostModel,
      ),
    );
  }
}

class BookMarksEditView extends StatefulWidget {
  final CoinCostModel? coinCostModel;
  const BookMarksEditView({Key? key, this.coinCostModel}) : super(key: key);

  @override
  State<BookMarksEditView> createState() => _BookMarksEditViewState();
}

class _BookMarksEditViewState extends State<BookMarksEditView> {
  late final ListFieldFormBlocEdit formBloc;

  @override
  void initState() {
    super.initState();
    formBloc = context.read<ListFieldFormBlocEdit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingActionButton(context),
      body: SafeArea(
        child: Padding(
          padding: context.paddingMedium,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _coinCostAndNameField(context),
                _formFields(context),
                _savedButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        formBloc.addMember();
        context.read<HomeViewModel>().addAnimatedList();
      },
    );
  }

  Widget _formFields(BuildContext context) {
    return DynamicFormFields(
      bloc: formBloc.members,
      onRemoved: (index) {
        formBloc.removeMember(index);
      },
    );
  }

  Widget _coinCostAndNameField(BuildContext context) {
    return CoinCostAndNameField(coinNameFieldBloc: formBloc.clubName, coinCostFieldBloc: formBloc.coinCost);
  }

  TextElevatedSaveButton _savedButton(BuildContext context) {
    return TextElevatedSaveButton(
      onPressed: (value) {
        CoinCostModel? _model = formBloc.onSubmitting();
        widget.coinCostModel?.id != null ? context.read<HomeViewModel>().putItem(widget.coinCostModel!.id!, _model) : null;
      },
    );
  }
}
