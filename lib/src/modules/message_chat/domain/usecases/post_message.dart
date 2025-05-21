import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message.dart';

abstract class IPostMessage{
  Future<bool> call({
    required Message message,
    required int idChat
  });
}

class PostMessageImpl implements IPostMessage{
  
  @override
  Future<bool> call({
    required Message message,
    required int idChat
  }) async{
    return true;
  }

}