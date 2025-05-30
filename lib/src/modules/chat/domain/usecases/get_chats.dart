import 'package:sticker_swap_app/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_app/src/modules/chat/infra/models/chat_model.dart';
import 'package:sticker_swap_app/src/services/http_service.dart';


abstract class IGetChats{
  Future<List<Chat>> call({required int idUser});
}

class GetChatsImpl implements IGetChats{

  final _httpService = HttpService();

  @override
  Future<List<Chat>> call({required int idUser}) async{
    try{
      final response = await _httpService.get(
        endpoint: "chat/conversas/user/$idUser",);
      return ChatModel.listFromJson(response.data, idUser);
    }catch(e){
      rethrow;
    }
  }

}