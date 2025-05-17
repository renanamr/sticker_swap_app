import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message.dart';

class MessageSimple extends Message{
  MessageSimple({
    required super.id,
    required super.message,
    required super.idSender,

    super.type=0
  });
}