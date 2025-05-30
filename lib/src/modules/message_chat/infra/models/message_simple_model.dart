import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message_simple.dart';

class MessageSimpleModel extends MessageSimple {
  MessageSimpleModel(
      {required super.id, required super.message, required super.idSender});

  factory MessageSimpleModel.fromMap(Map<String, dynamic> map) {
    return MessageSimpleModel(
      id: map['id'],
      message: map['text_content'],
      idSender: map['sender'],
    );
  }
}
