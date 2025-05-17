import 'package:flutter/widgets.dart';
import 'package:sticker_swap_app/src/config/widget_module_config.dart';
import 'package:sticker_swap_app/src/modules/filter/presenter/filter_bloc.dart';
import 'package:sticker_swap_app/src/modules/filter/presenter/filter_screen.dart';

class FilterModule extends WidgetModule{
  const FilterModule({super.key});

  @override
  void binds(i) {
    i.add<FilterBloc>(FilterBloc.new);
  }

  @override
  Widget get view => FilterScreen();
}