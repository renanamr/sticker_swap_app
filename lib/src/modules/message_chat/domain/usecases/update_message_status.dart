import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message.dart';

abstract class IUpdateMessageStatus{
  Future<bool> call({
    required Message message,
    required int newStatus,
    required int idChat
  });
}

class UpdateMessageStatusImpl implements IUpdateMessageStatus{
  
  @override
  Future<bool> call({
    required Message message,
    required int newStatus,
    required int idChat
  }) async{
    return true;
  }

}