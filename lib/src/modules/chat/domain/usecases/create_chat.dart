import 'package:sticker_swap_app/src/core/entities/user.dart';
import 'package:sticker_swap_app/src/modules/chat/domain/entities/chat.dart';

abstract class ICreateChat{
  Future<Chat?> call({required User user, required User otherUser});
}

class CreateChatImpl implements ICreateChat{

  @override
  Future<Chat?> call({required User user, required User otherUser}) async{
    try{
      return Chat(
        id: 1,
        name: otherUser.firstName!,
        image: "",
      );
    }catch(e){
      return null;
    }
  }

}