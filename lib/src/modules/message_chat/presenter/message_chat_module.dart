import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/modules/message_chat/domain/usecases/get_messages.dart';
import 'package:sticker_swap_app/src/modules/message_chat/domain/usecases/post_message.dart';
import 'package:sticker_swap_app/src/modules/message_chat/domain/usecases/update_message_status.dart';
import 'package:sticker_swap_app/src/modules/message_chat/presenter/message_chat_bloc.dart';
import 'package:sticker_swap_app/src/modules/message_chat/presenter/message_chat_screen.dart';

class MessageChatModule extends Module{
  @override
  void binds(i) {
    i.add<MessageChatBloc>(MessageChatBloc.new);

    i.add<IGetMessages>(GetMessagesImpl.new);
    i.add<IPostMessage>(PostMessageImpl.new);
    i.add<IUpdateMessageStatus>(UpdateMessageStatusImpl.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => MessageChatScreen(chat: r.args.data,));
  }
}