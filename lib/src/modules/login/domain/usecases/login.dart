import 'dart:convert';

import 'package:sticker_swap_app/src/core/entities/auth.dart';
import 'package:sticker_swap_app/src/services/http_service.dart';

abstract class ILogin{
  Future<Auth> call(String email, String password);
}

class LoginUseCase implements ILogin {

  final _httpService = HttpService();

  @override
  Future<Auth> call(String username, String password) async {
    try{
      final response = await _httpService.post(
          endpoint: 'accounts/login/',
          data: jsonEncode({'username': username, 'password': password}));


      if(response.statusCode >= 200 && response.statusCode < 300){
        final result = response.data as Map;
        return Auth(
          token: result["access_token"],
          refreshToken: result["refresh_token"],
          idUserAuthenticated: result["id"]
        );
      }else{
        throw Exception("Falha na autenticação");
      }
    }catch(e){
      rethrow;
    }
  }

}
