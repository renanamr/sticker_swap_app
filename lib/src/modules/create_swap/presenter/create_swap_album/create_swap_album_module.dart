import 'package:flutter/material.dart';
import 'package:sticker_swap_app/src/config/widget_module_config.dart';
import 'package:sticker_swap_app/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_app/src/modules/create_swap/presenter/create_swap_album/create_swap_album_bloc.dart';

import 'create_swap_album_screen.dart';

class CreateSwapAlbum extends WidgetModule {
  final ReferenceSwap referenceSwap;
  final String nameOtherUser;
  final Function(ReferenceSwap referenceSwap) sendRefereceSwap;

  const CreateSwapAlbum(
      {super.key, required this.referenceSwap,
      required this.nameOtherUser,
      required this.sendRefereceSwap});

  @override
  void binds(i) {
        i.add<CreateSwapAlbumBloc>(() => CreateSwapAlbumBloc(
          referenceSwap: referenceSwap,
          nameOtherUser: nameOtherUser,
          sendRefereceSwap: sendRefereceSwap
        ));
  }

  @override
  Widget get view => const CreateSwapAlbumScreen();
}
