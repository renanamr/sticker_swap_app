import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_app/src/modules/message_chat/infra/models/message_place_model.dart';
import 'package:sticker_swap_app/src/modules/message_chat/infra/models/message_simple_model.dart';

class MessageModel extends Message {
  MessageModel(
      {required super.id,
      required super.type,
      required super.message,
      required super.idSender});

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['chat'],
      type: map['message_type'],
      message: map['text_content'],
      idSender: map['sender'],
    );
  }

  static List<Message> listFromJson(List<dynamic> json) {
    return (json)
        .map((e){
          if(e['message_type'] == "text") {
            return MessageSimpleModel.fromMap(e as Map<String, dynamic>) as Message;
          }
          if(e['message_type'] == "location") {
            return MessagePlaceModel.fromMap(e as Map<String, dynamic>) as Message;
          }

          return MessageModel.fromMap(e as Map<String, dynamic>);
        }).toList();
  }
}
