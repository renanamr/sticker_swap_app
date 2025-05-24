import 'package:flutter/widgets.dart';
import 'package:sticker_swap_app/src/config/widget_module_config.dart';

import '../../domain/entities/reference_swap.dart';
import 'create_swap_suggestion_bloc.dart';
import 'create_swap_suggestion_screen.dart';

class CreateSwapSuggestion extends WidgetModule {
  final Function(int) proximaTela;
  final String nameOtherUser;
  final ReferenceSwap referenceSwap;

  const CreateSwapSuggestion({
    super.key,
    required this.referenceSwap,
    required this.proximaTela,
    required this.nameOtherUser,
  });


  @override
  void binds(i) {
    i.add<CreateSwapSuggestionBloc>(() => CreateSwapSuggestionBloc(
        proximaTela: proximaTela,
        referenceSwap: referenceSwap,
        nameOtherUser: nameOtherUser,
    ));
  }

  @override
  Widget get view => CreateSwapSuggestionScreen();
}