import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sticker_swap_app/src/core/entities/auth.dart';

abstract class ILogin{
  Future<Auth> call(String email, String password);
}

class LoginUseCase implements ILogin {

  final Dio dio = Dio();

  @override
  Future<Auth> call(String email, String password) async {
    try{
      final response = await dio.post(
          '${dotenv.env['API_URI']!}/api/login',
          data: {'email': email, 'password': password}
      );
      debugPrint(dotenv.env['API_URI']);

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
