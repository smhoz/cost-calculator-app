import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/home/viewmodel/home_view_model.dart';
import '../../screens/home/viewmodel/list_fields_form_bloc.dart';


class FloatingActionButtonAddWiget extends StatelessWidget {
  const FloatingActionButtonAddWiget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            final formBloc = context.read<ListFieldFormBloc>();
            final homeViewModel = context.read<HomeViewModel>();
            formBloc.addMember();
            homeViewModel.addAnimatedList();
          },
        ),
      ],
    );
  }
}
