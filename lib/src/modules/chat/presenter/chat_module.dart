import 'package:flutter/widgets.dart';
import 'package:sticker_swap_app/src/config/widget_module_config.dart';
import 'package:sticker_swap_app/src/modules/chat/domain/usecases/get_chats.dart';
import 'package:sticker_swap_app/src/modules/chat/presenter/chat_bloc.dart';
import 'package:sticker_swap_app/src/modules/chat/presenter/chat_screen.dart';

class ChatModule extends WidgetModule{
  const ChatModule({super.key});

  @override
  void binds(i) {
    i.add<ChatBloc>(ChatBloc.new);
    i.add<IGetChats>(GetChatsImpl.new);
  }

  @override
  Widget get view => const ChatScreen();
}