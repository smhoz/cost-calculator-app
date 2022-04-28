import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../constants/components/app_components_constants.dart';
import '../../screens/home/model/coin_model.dart';
import '../../screens/home/viewmodel/global_list_view_model.dart';
import 'coin_fields.dart';

class DynamicFormFields extends StatelessWidget {
  final ListFieldBloc<CoinFieldBloc, dynamic> bloc;
  final Function(int index)? onRemoved;

  const DynamicFormFields({Key? key, required this.bloc, this.onRemoved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListFieldBloc<CoinFieldBloc, dynamic>, ListFieldBlocState<CoinFieldBloc, dynamic>>(
      bloc: bloc,
      builder: (context, state) {
        if (state.fieldBlocs.isNotEmpty) {
          return AnimatedList(
            key: context.read<GlobalListViewModel>().listKey,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            initialItemCount: state.fieldBlocs.length,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                position: AppComponentConstants.instance.listTweenAnimation(animation),
                child: _costFields(state, index, context),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  CostFields _costFields(ListFieldBlocState<CoinFieldBloc, dynamic> state, int index, BuildContext context) {
    return CostFields(
      memberField: state.fieldBlocs[index],
      onRemoveMember: () {
        onRemoved != null ? onRemoved!(index) : null;
        context.read<GlobalListViewModel>().listKey.currentState?.removeItem(index, (context, animation) => const SizedBox.shrink());
      },
    );
  }
}
