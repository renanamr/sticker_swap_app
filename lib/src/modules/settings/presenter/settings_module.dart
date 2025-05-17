import 'package:flutter/widgets.dart';
import 'package:sticker_swap_app/src/config/widget_module_config.dart';
import 'package:sticker_swap_app/src/modules/settings/presenter/settings_bloc.dart';
import 'package:sticker_swap_app/src/modules/settings/presenter/settings_screen.dart';

class SettingsModule extends WidgetModule{
  const SettingsModule({super.key});

  @override
  void binds(i) {
    i.add<SettingsBloc>((i) => SettingsBloc());
  }

  @override
  Widget get view => const SettingsScreen();

}