import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sticker_swap_app/src/modules/register/domain/entities/register.dart';

abstract class IRegisterUser {
  Future<bool> call(Register register);
}

class RegisterUserUseCase implements IRegisterUser {
  final Dio dio = Dio();

  @override
  Future<bool> call(Register register) async {
    try{
      final response = await dio.post(
          '${dotenv.env['API_URI']!}/api/accounts/register/',
          data: jsonEncode(register.toMap()));

      return response.statusCode == 201;
    }catch(e){
      return false;
    }
  }
}
