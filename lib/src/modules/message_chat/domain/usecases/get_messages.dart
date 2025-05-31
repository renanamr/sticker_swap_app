import 'package:sticker_swap_app/src/core/entities/album.dart';
import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message_place.dart';
import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message_simple.dart';
import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message_swap_stickers.dart';
import 'package:sticker_swap_app/src/modules/message_chat/infra/models/message_model.dart';
import 'package:sticker_swap_app/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_app/src/services/http_service.dart';
import 'package:sticker_swap_app/src/utils/const/status_message_confirm.dart';

abstract class IGetMessages{
  Future<List<Message>> call({required int idChat, required int lastID});
}

class GetMessagesImpl implements IGetMessages{

  final _httpService = HttpService();

  @override
  Future<List<Message>> call({required int idChat, required int lastID}) async{
    try{
      final response = await _httpService.get(
        endpoint: "chat/conversas/$idChat/mensagens/",
      );
      return MessageModel.listFromJson(response.data);
    }catch(e){
      rethrow;
    }
  }
}