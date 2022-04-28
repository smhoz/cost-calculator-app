import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/notifier/theme_notifier.dart';
import 'product/constants/app/app_constants.dart';
import 'product/init/product_init.dart';
import 'product/screens/home/view/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ProductInit.instance.mainInit();

  runApp(MultiProvider(
    providers: ProductInit.instance.providerLists,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstant.appTitle,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeNotifier>(context).getTheme,
    );
  }
}
