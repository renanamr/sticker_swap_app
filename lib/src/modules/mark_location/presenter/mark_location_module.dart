import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/config/widget_module_config.dart';
import 'package:sticker_swap_app/src/modules/mark_location/presenter/mark_location_bloc.dart';
import 'package:sticker_swap_app/src/modules/mark_location/presenter/mark_location_screen.dart';
import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message_place.dart';

class MarkLocationModule extends WidgetModule{

  final Function(MessagePlace) markLocation;
  const MarkLocationModule({super.key, required this.markLocation});

  @override
  void binds(i) {
    i.add<MarkLocationBloc>((i) => MarkLocationBloc(markLocation: markLocation));
  }

  @override
  Widget get view => MarkLocationScreen();
}