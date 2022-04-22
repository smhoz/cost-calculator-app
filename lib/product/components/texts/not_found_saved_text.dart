import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extension.dart';

class NotFoundSaved extends StatelessWidget {
  const NotFoundSaved({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("You Don't Have Any Saved.", style: context.textTheme.headline2));
  }
}
