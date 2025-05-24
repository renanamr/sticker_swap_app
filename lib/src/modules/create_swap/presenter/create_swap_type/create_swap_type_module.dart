import 'package:flutter/material.dart';
import 'package:sticker_swap_app/src/config/widget_module_config.dart';
import 'package:sticker_swap_app/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_app/src/modules/create_swap/presenter/create_swap_type/create_swap_type_bloc.dart';
import 'package:sticker_swap_app/src/modules/create_swap/presenter/create_swap_type/create_swap_type_screen.dart';

class CreateSwapType extends WidgetModule {

  final Function(int) proximaTela;
  final String nameOtherUser;
  final ReferenceSwap referenceSwap;

  const CreateSwapType({
    super.key,
    required this.referenceSwap,
    required this.proximaTela,
    required this.nameOtherUser,
  });

  @override
  void binds(i) {
    i.add<CreateSwapTypeBloc>(() =>
        CreateSwapTypeBloc(
            referenceSwap: referenceSwap,
            proximaTela: proximaTela,
            nameOtherUser: nameOtherUser
        ));
  }

  @override
  Widget get view => const CreateSwapTypeScreen();
}
