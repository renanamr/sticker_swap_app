import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ILogin{
  Future<Map?> call(String email, String password);
}

class LoginUseCase implements ILogin {

  final Dio dio = Dio();

  @override
  Future<Map?> call(String email, String password) async {
    final response = await dio.post(
        '${dotenv.env['API_URI']!}/api/login',
        data: {'email': email, 'password': password}
    );
    debugPrint(dotenv.env['API_URI']);

    if(response.statusCode == 201){
      var decodedResponse = response.data as Map;
      return decodedResponse;
    }

    return null;
  }

}
