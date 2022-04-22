import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'core/notifier/theme_notifier.dart';
import 'product/constants/app_constants.dart';
import 'product/init/notifier/provider_lists.dart';
import 'product/manager/change_theme_cache_manager.dart';
import 'product/screens/home/view/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _init();

  runApp(MultiProvider(
    providers: ProviderLists.instance.providerLists(),
    child: const MyApp(),
  ));
}

Future<void> _init() async {
  await Hive.initFlutter();
  await ChangeThemeCacheManager.instance.init();
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
