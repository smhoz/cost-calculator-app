import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../../core/init/theme/dark/dark_theme.dart';
import '../../../../../core/init/theme/light/light_theme.dart';
import '../../../../../core/notifier/theme_notifier.dart';
import '../../manager/theme_cache_manager.dart';
import '../../screens/bookmarks/viewmodel/cost_save_view_model.dart';
import '../../screens/home/viewmodel/cubit/list_fields_form_bloc.dart';
import '../../screens/home/viewmodel/global_list_view_model.dart';
import '../../screens/home/viewmodel/tab_view_model.dart';

class ProviderLists {
  static ProviderLists? _instance;
  ProviderLists._();
  static ProviderLists get instance => _instance ?? ProviderLists._();

  List<SingleChildWidget> providerLists() {
    return [
      ChangeNotifierProvider(create: (context) => CostSaveViewModel()),
      Provider(create: ((context) => GlobalListViewModel())),
      ChangeNotifierProvider(
          create: (context) =>
              ThemeNotifier(ThemeCacheManager.instance.get(ThemeKey.theme.name) ? AppThemeDark.instance.theme : AppThemeLight.instance.theme)),
      ChangeNotifierProvider(create: (context) => TabViewModel()),
      BlocProvider(create: (context) => ListFieldFormBloc()),
    ];
  }
}
