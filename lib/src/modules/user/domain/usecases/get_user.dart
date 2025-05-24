import 'package:sticker_swap_app/src/core/entities/user.dart';
import 'package:sticker_swap_app/src/modules/login/infra/models/user_model.dart';
import 'package:sticker_swap_app/src/services/http_service.dart';

abstract class IGetUser{
  Future<User> call ();
}

class GetUserImpl implements IGetUser{

  final _httpService = HttpService();

  @override
  Future<User> call () async{
    //TODO: Remover mock posteriormente
    return _mock();
    try{
      final response = await _httpService.get(endpoint: "api/account");
      return UserModel.fromMap(response.data);
    }catch(e){
      rethrow;
    }
  }

  User _mock()=>
      User(id: 1, username: "renan", name: "renan.rocha", image: "", email: "r@gamil,");

}