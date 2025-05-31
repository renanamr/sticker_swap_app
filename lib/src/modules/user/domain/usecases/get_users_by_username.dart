import 'package:sticker_swap_app/src/core/entities/user.dart';
import 'package:sticker_swap_app/src/modules/login/infra/models/user_model.dart';
import 'package:sticker_swap_app/src/services/http_service.dart';

abstract class IGetUsersByUsername{
  Future<List<User>> call (String username);
}

class GetUsersByUsernameImpl implements IGetUsersByUsername{

  final _httpService = HttpService();

  @override
  Future<List<User>> call (String username) async{
    try{
      final response = await _httpService.get(
        endpoint: "accounts",
        queryParameters: {"username": username}
      );
      return UserModel.listFromJson(response.data);
    }catch(e){
      rethrow;
    }
  }

}