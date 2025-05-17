import 'package:flutter/widgets.dart';
import 'package:sticker_swap_app/src/config/widget_module_config.dart';
import 'package:sticker_swap_app/src/modules/create_swap/presenter/create_swap_bloc.dart';
import 'package:sticker_swap_app/src/modules/create_swap/presenter/create_swap_screen.dart';

class CreateSwapModule extends WidgetModule{
  const CreateSwapModule({super.key});

  @override
  void binds(i) {
    i.add<CreateSwapBloc>(CreateSwapBloc.new);
  }

  @override
  Widget get view => CreateSwapScreen();

}