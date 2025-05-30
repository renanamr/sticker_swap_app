import 'dart:convert';

import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message_place.dart';
import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message_swap_stickers.dart';
import 'package:sticker_swap_app/src/services/http_service.dart';

abstract class IPostMessage{
  Future<bool> call({
    required Message message,
    required int idChat
  });
}

class PostMessageImpl implements IPostMessage{

  final _httpService = HttpService();

  @override
  Future<bool> call({
    required Message message,
    required int idChat
  }) async{
    try{
      final response = await _httpService.post(
          endpoint: "chat/mensagens/",
          data: jsonEncode(_getData(message, idChat))
      );

      message.id = response.data["id"];
      return true;
    }catch(e){
      return false;
    }
  }


  Map<String, dynamic> _getData(Message message, int idChat){
    switch(message.type){
      case 0:
        return _mapSimpleMessage(message, idChat);
      case 1:
        return _mapSwapMessage(message, idChat);
      case 2:
        return _mapPlaceMessage(message, idChat);
    }

    return {};
  }

  Map<String, dynamic> _mapSimpleMessage(Message message, int idChat){
    return {
      "message_type": 0,
      "text_content": message.message,
      "sender": message.idSender,
      "chat": idChat,
    };
  }

  Map<String, dynamic> _mapSwapMessage(Message message, int idChat){
    MessageSwapStickers messageSwap = message as MessageSwapStickers;
    return {
      "message_type": 1,
      "chat": idChat,
      "text_content": messageSwap.message,
      "sender": messageSwap.idSender,
      "status": messageSwap.status,
      "stickerNeed": messageSwap.stickersNeed.toMap(),
      "stickerSender": messageSwap.stickersSender.toMap(),
    };
  }

  Map<String, dynamic> _mapPlaceMessage(Message message, int idChat){
    MessagePlace messagePlace = message as MessagePlace;
    return {
      "message_type": 2,
      "chat": idChat,
      "text_content": messagePlace.message,
      "sender": messagePlace.idSender,
      "suggestion_data": messagePlace.date,
      "location_data": messagePlace.place,
      "status": messagePlace.status,
      "time": messagePlace.time
    };
  }

}