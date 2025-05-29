import 'package:sticker_swap_app/src/core/entities/user.dart';
import 'package:sticker_swap_app/src/modules/login/infra/models/user_model.dart';
import 'package:sticker_swap_app/src/services/http_service.dart';

abstract class IGetUserByID{
  Future<User> call (int idUser);
}

class GetUserByIDImpl implements IGetUserByID{

  final _httpService = HttpService();

  @override
  Future<User> call (int idUser) async{
    try{
      final response = await _httpService.get(endpoint: "accounts/$idUser");
      return UserModel.fromMap(response.data);
    }catch(e){
      rethrow;
    }
  }

}