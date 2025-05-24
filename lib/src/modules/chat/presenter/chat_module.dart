import 'package:flutter/widgets.dart';
import 'package:sticker_swap_app/src/config/widget_module_config.dart';
import 'package:sticker_swap_app/src/modules/chat/domain/usecases/create_chat.dart';
import 'package:sticker_swap_app/src/modules/chat/domain/usecases/get_chats.dart';
import 'package:sticker_swap_app/src/modules/chat/presenter/chat_bloc.dart';
import 'package:sticker_swap_app/src/modules/chat/presenter/chat_screen.dart';
import 'package:sticker_swap_app/src/modules/user/domain/usecases/get_user_by_id.dart';

class ChatModule extends WidgetModule{
  const ChatModule({super.key});

  @override
  void binds(i) {
    i.add<ChatBloc>(ChatBloc.new);
    i.add<IGetUserByID>(GetUserByIDImpl.new);
    i.add<IGetChats>(GetChatsImpl.new);
    i.add<ICreateChat>(CreateChatImpl.new);
  }

  @override
  Widget get view => const ChatScreen();
}