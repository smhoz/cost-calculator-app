import 'package:flutter/material.dart';

import '../../../../core/constants/app_duration_constants.dart';
import '../../../constants/components/app_components_constants.dart';

class GlobalListViewModel{
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  void addAnimatedList() {
    listKey.currentState?.insertItem(kZero.toInt(), duration: AppDuration.longDuration());
  }

  void removeAnimatedList(int index) {
    listKey.currentState?.removeItem(index, (context, animation) => const SizedBox.shrink());
  }
}
