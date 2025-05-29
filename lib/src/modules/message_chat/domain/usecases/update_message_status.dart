import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_app/src/services/http_service.dart';

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
    //TODO: Remover Mock
    return true;
    try{
      final response = await _httpService.patch(
        endpoint: "api/update_message",
        data: {
          "status-message": newStatus
        }
      );

      message.id = response.data["id"];
      return true;
    }catch(e){
      return false;
    }
  }

}