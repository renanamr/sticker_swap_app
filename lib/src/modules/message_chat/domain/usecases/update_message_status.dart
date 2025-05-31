import 'dart:convert';

import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_app/src/services/http_service.dart';
import 'package:sticker_swap_app/src/utils/const/status_message_confirm.dart';

abstract class IUpdateMessageStatus{
  Future<bool> call({
    required Message message,
    required int newStatus,
    required int idChat
  });
}

class UpdateMessageStatusImpl implements IUpdateMessageStatus{

  final _httpService = HttpService();

  @override
  Future<bool> call({
    required Message message,
    required int newStatus,
    required int idChat
  }) async{
    try{
      if(message.type == "location"){
        await _httpService.put(
            endpoint: "chat/mensagens/${message.id}/confirmar-local/",
            data: jsonEncode({
              "message_type": message.type,
              "chat": idChat,
              "sender": message.idSender,
              "location_confirmed": newStatus == StatusMessageConfirm.accepted
            })
        );
      }else{
        await _httpService.put(
            endpoint: "chat/mensagens/${message.id}/confirmar-troca/",
            data: jsonEncode({
              "message_type": message.type,
              "chat": idChat,
              "sender": message.idSender,
              "exchange_confirmed": newStatus == StatusMessageConfirm.accepted
            })
        );
      }

      return true;
    }catch(e){
      return false;
    }
  }

}