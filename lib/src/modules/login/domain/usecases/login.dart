import 'package:sticker_swap_app/src/core/entities/auth.dart';
import 'package:sticker_swap_app/src/services/http_service.dart';

abstract class ILogin{
  Future<Auth> call(String email, String password);
}

class LoginUseCase implements ILogin {

  final _httpService = HttpService();

  @override
  Future<Auth> call(String email, String password) async {
    try{
      final response = await _httpService.post(
          endpoint: '/api/login',
          data: {'email': email, 'password': password}
      );

      if(response.statusCode == 201 || response.statusCode == 203){
        var result = response.data as Map;
        return Auth(
          token: result["token"],
          refreshToken:  result["refresh-token"],
        );
      }else{
        throw Exception("Falha na autenticação");
      }
    }catch(e){
      rethrow;
    }
  }

}
