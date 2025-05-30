import 'dart:convert';

import 'package:sticker_swap_app/src/core/entities/user.dart';
import 'package:sticker_swap_app/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_app/src/modules/chat/infra/models/chat_model.dart';
import 'package:sticker_swap_app/src/services/http_service.dart';

abstract class ICreateChat{
  Future<Chat?> call({required User user, required User otherUser});
}

class CreateChatImpl implements ICreateChat{

  final _httpService = HttpService();


  @override
  Future<Chat?> call({required User user, required User otherUser}) async{
    try{
      final response = await _httpService.post(
        endpoint: "chat/conversas/",
        data: jsonEncode({"participants": [user.id, otherUser.id]})
      );

      return ChatModel.fromMap(response.data, user.id!);
    }catch(e){
      return null;
    }
  }

}