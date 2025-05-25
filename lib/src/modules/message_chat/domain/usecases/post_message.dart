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
    //TODO: Remover Mock
    return true;
    try{
      final response = await _httpService.put(
          endpoint: "api/update_message",
          data: _getData(message)
      );

      message.id = response.data["id"];
      return true;
    }catch(e){
      return false;
    }
  }


  Map<String, dynamic> _getData(Message message){
    switch(message.type){
      case 0:
        return _mapSimpleMessage(message);
      case 1:
        return _mapSwapMessage(message);
      case 2:
        return _mapPlaceMessage(message);
    }

    return {};
  }

  Map<String, dynamic> _mapSimpleMessage(Message message){
    return {
      "id": message.id,
      "type": 0,
      "message": message.message,
      "idSender": message.idSender,
    };
  }

  Map<String, dynamic> _mapSwapMessage(Message message){
    MessageSwapStickers messageSwap = message as MessageSwapStickers;
    return {
      "id": messageSwap.id,
      "type": 1,
      "message": messageSwap.message,
      "idSender": messageSwap.idSender,
      "status": messageSwap.status,
      "stickerNeed": messageSwap.stickersNeed.toMap(),
      "stickerSender": messageSwap.stickersSender.toMap(),
    };
  }

  Map<String, dynamic> _mapPlaceMessage(Message message){
    MessagePlace messagePlace = message as MessagePlace;
    return {
      "id": messagePlace.id,
      "type": 2,
      "message": messagePlace.message,
      "idSender": messagePlace.idSender,
      "date": messagePlace.date,
      "place": messagePlace.place,
      "status": messagePlace.status,
      "time": messagePlace.time
    };
  }

}