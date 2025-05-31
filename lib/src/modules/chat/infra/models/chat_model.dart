import 'package:sticker_swap_app/src/modules/chat/domain/entities/chat.dart';

class ChatModel extends Chat {
  ChatModel({
      required super.id,
      required super.name,
      required super.image,
      required super.lastMessage,
      super.idUser,
  });

  factory ChatModel.fromMap(Map<String, dynamic> map, int myIdUser) {
    int? position;
    final listParticipants = map["participants"] as List<dynamic>;

    for(int index=0; index < listParticipants.length; index++){
      if(myIdUser != map["participants"][index]){
        position = index;
        break;
      }
    }

    return ChatModel(
      id: map['id'],
      idUser: map["participants"][position],
      name: map['participants_usernames'][position],
      image: map['picture'] ?? "",
      lastMessage: null,
    );
  }

  static List<ChatModel> listFromJson(List<dynamic> json, int myIdUser) {
    return (json)
        .map((e) => ChatModel.fromMap(e as Map<String, dynamic>, myIdUser))
        .toList();
  }
}
