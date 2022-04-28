import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../../core/init/theme/dark/dark_theme.dart';
import '../../../../../core/init/theme/light/light_theme.dart';
import '../../../../../core/notifier/theme_notifier.dart';
import '../../manager/change_theme_cache_manager.dart';
import '../../screens/home/viewmodel/home_view_model.dart';
import '../../screens/home/viewmodel/list_fields_form_bloc.dart';
import '../../screens/home/viewmodel/tab_view_model.dart';

class ProviderLists {
  static ProviderLists? _instance;
  ProviderLists._();
  static ProviderLists get instance => _instance ?? ProviderLists._();

  List<SingleChildWidget> providerLists() {
    return [
      ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ChangeNotifierProvider(
          create: (context) =>
              ThemeNotifier(ChangeThemeCacheManager.instance.get(ThemeKey.theme.name) ? AppThemeDark.instance.theme : AppThemeLight.instance.theme)),
      ChangeNotifierProvider(create: (context) => TabViewModel()),
      BlocProvider(create: (context) => ListFieldFormBloc()),
    ];
  }
}
