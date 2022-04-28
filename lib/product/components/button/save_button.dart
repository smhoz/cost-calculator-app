import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extension.dart';
import '../../manager/remember_choice_cache_manager.dart';
import '../dialog/custom_dialog.dart';

class TextElevatedSaveButton extends StatefulWidget {
  final Function(bool alertDialogOnPressed) onPressed;
  final String? text;
  const TextElevatedSaveButton({Key? key, required this.onPressed, this.text}) : super(key: key);

  @override
  State<TextElevatedSaveButton> createState() => _TextElevatedSaveButtonState();
}

class _TextElevatedSaveButtonState extends State<TextElevatedSaveButton> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async => await RememberChoiceCacheManager.instance.init());
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size(context.width, context.dynamicHeight(0.05))),
        onPressed: _onPressed,
        child: Text(
          widget.text ?? "Calculate",
          style: context.textTheme.bodyText2?.copyWith(color: context.themeColor.onSecondary),
        ));
  }

  void _onPressed() {
    bool rememberChoice = RememberChoiceCacheManager.instance.get(RememberChoiceCacheKey.rememberChoice.name);

    widget.onPressed(rememberChoice);

    if (!rememberChoice) {
      animatedDialog(context, RememberChoiceCacheManager.instance);
    }
  }

  void animatedDialog(BuildContext context, RememberChoiceCacheManager rememberChoiceCacheManager) async {
    context.showAnimationDialog(
      child: CustomDialog(
        saveOnPressed: () {
          widget.onPressed(true);
        },
      ),
    );
  }
}
