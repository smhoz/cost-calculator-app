import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_border_radius.dart';
import '../../../core/constants/app_sized_box.dart';
import '../../../core/extensions/context_extension.dart';
import '../../manager/remember_choice_cache_manager.dart';

class CustomDialog extends StatelessWidget {
  final VoidCallback saveOnPressed;
  const CustomDialog({Key? key, required this.saveOnPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.normalAllCircular()),
      child: Padding(
        padding: context.paddingMedium,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _saveText(context),
            const AppSizedBox.normalHeightSizedBox(),
            _isGetRegisteredText(context),
            const AppSizedBox.lowHeightSizedBox(),
            _switchListenable(),
            const AppSizedBox.lowHeightSizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _cancelButton(context),
                _saveButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text _saveText(BuildContext context) {
    return Text(
      "Do you want to save ?",
      style: context.textTheme.bodyText2,
    );
  }

  Text _isGetRegisteredText(BuildContext context) {
    return Text(
      "Do you want to save the cost you calculated?",
      style: context.textTheme.headline4,
    );
  }

  ElevatedButton _saveButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(textStyle: context.textTheme.headline4),
      onPressed: () {
        saveOnPressed();
        context.pop();
      },
      child: const Text("Save"),
    );
  }

  TextButton _cancelButton(BuildContext context) {
    return TextButton(
      onPressed: context.pop,
      child: const Text("Cancel"),
    );
  }

  ValueListenableBuilder<Object?> _switchListenable() {
    RememberChoiceCacheManager rememberChoiceCacheManager = RememberChoiceCacheManager.instance;
    return ValueListenableBuilder(
        valueListenable: RememberChoiceCacheManager.instance.listenable(),
        builder: (context, box, widget) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Remember choice", style: context.textTheme.headline4),
              _switch(rememberChoiceCacheManager),
            ],
          );
        });
  }

  Transform _switch(RememberChoiceCacheManager rememberChoiceCacheManager) {
    return Transform.scale(
      scale: 0.7,
      child: CupertinoSwitch(
        value: rememberChoiceCacheManager.get(RememberChoiceCacheKey.rememberchoicekey.name),
        onChanged: (value) => rememberChoiceCacheManager.putItem(RememberChoiceCacheKey.rememberchoicekey.name, value),
      ),
    );
  }
}
