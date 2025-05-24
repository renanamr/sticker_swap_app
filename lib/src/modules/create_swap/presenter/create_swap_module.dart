import 'package:flutter/widgets.dart';
import 'package:sticker_swap_app/src/config/widget_module_config.dart';
import 'package:sticker_swap_app/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_app/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_app/src/modules/create_swap/domain/usecases/get_reference_swap.dart';
import 'package:sticker_swap_app/src/modules/create_swap/presenter/create_swap_bloc.dart';
import 'package:sticker_swap_app/src/modules/create_swap/presenter/create_swap_screen.dart';
import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message_swap_stickers.dart';

class CreateSwapModule extends WidgetModule {

  final Chat? chat;
  final MessageSwapStickers? messageSwap;
  final Function(ReferenceSwap referenceSwap) sendReferenceSwap;
  const CreateSwapModule({
    super.key,
    this.chat,
    this.messageSwap,
    required this.sendReferenceSwap
  });

  @override
  void binds(i) {
    i.add<CreateSwapBloc>(CreateSwapBloc.new);
    i.add<IGetReferenceSwap>(GetReferenceSwap.new);
  }

  @override
  Widget get view => CreateSwapScreen(
    chat: chat,
    messageSwap: messageSwap,
    sendRefereceSwap: sendReferenceSwap,
  );
}
