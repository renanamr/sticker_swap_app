import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/core/entities/auth.dart';
import 'package:sticker_swap_app/src/core/entities/user.dart';
import 'package:sticker_swap_app/src/modules/login/domain/usecases/login.dart';

class LoginBloc {

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool validate = true;

  final user = Modular.get<User>();
  final auth = Modular.get<Auth>();

  final loginUseCase = Modular.get<ILogin>();


  void verifyAuth() => Modular.to.pushReplacementNamed("/home/");

  void toRegisterScreen() => Modular.to.pushNamed("/register/");

  void toRecoverScreen() => Modular.to.pushNamed("/recover/");

  Future<void> login() async {
    var response = await loginUseCase(email.text, password.text);
    if (!validate || response?['token'] == null) {
      return;
    }
    auth.token = response!['token'];
    user.id = response['id'];
    verifyAuth();
  }

  void dispose() {
    email.dispose();
    password.dispose();
  }

}