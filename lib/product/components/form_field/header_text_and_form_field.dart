import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../core/constants/app_border_radius.dart';
import '../../../core/extensions/context_extension.dart';
import '../../constants/components/app_components_constants.dart';

class HeaderTextAndFormField extends StatelessWidget {
  final String? headerText;
  final TextStyle? headerTextStyle;
  final InputDecoration? inputDecoration;
  final SizedBox? sizedBox;
  final double? formFieldWidth;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? suffixBoxConstraints;
  final bool? enabled;
  final bool? readOnly;
  final String? initalValue;
  final TextStyle? formFieldStlye;
  final UniqueKey? name;
  final VoidCallback? onPressed;
  final TextEditingController? textEditingController;
  final TextFieldBloc textFieldBloc;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  const HeaderTextAndFormField({
    Key? key,
    this.headerText,
    this.textInputType,
    required this.textFieldBloc,
    this.name,
    this.onPressed,
    this.readOnly,
    this.textEditingController,
    this.hintText,
    this.formFieldWidth,
    this.inputDecoration,
    this.headerTextStyle,
    this.prefixIcon,
    this.initalValue,
    this.enabled,
    this.suffixIcon,
    this.textInputAction,
    this.formFieldStlye,
    this.suffixBoxConstraints,
    this.labelText,
    this.sizedBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerText == null ? const SizedBox.shrink() : _headerText(context),
        SizedBox(
          width: formFieldWidth,
          child: TextFieldBlocBuilder(
            textFieldBloc: textFieldBloc,
            keyboardType: textInputType ?? TextInputType.number,
            textStyle: formFieldStlye,
            readOnly: readOnly ?? false,
            textInputAction: textInputAction ?? TextInputAction.next,
            decoration: inputDecoration ?? _inputDecoration(context),
          ),
        ),
      ],
    );
  }

  Text _headerText(BuildContext context) => Text(headerText ?? "",
      style: headerTextStyle ?? context.textTheme.bodyText1?.copyWith(fontSize: AppComponentConstants.instance.fieldHeaderTextFontSize));

  InputDecoration _inputDecoration(BuildContext context) {
    return InputDecoration(
      fillColor: context.themeColor.secondary,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: context.themeColor.primaryContainer, width: 1.0),
        borderRadius: AppBorderRadius.normalAllCircular(),
      ),
      filled: true,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      hintText: hintText,
      labelText: labelText,
      suffixIconConstraints: suffixBoxConstraints,
      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: AppBorderRadius.normalAllCircular()),
    );
  }
}
