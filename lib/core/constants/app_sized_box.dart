import 'package:flutter/cupertino.dart';

class AppSizedBox extends SizedBox {
  const AppSizedBox.lowHeightSizedBox({Key? key}) : super(height: 8, key: key);
  const AppSizedBox.normalHeightSizedBox({Key? key}) : super(height: 16, key: key);
  const AppSizedBox.lowWidthSizedBox({Key? key}) : super(width: 8, key: key);
  const AppSizedBox.normalWidthSizedBox({Key? key}) : super(width: 16, key: key);
}
