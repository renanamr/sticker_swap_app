import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message.dart';

class Chat{
  int id;
  String name;
  String image;
  Message? lastMessage;

  Chat({
    required this.id,
    required this.name,
    required this.image,
    this.lastMessage
  });
}