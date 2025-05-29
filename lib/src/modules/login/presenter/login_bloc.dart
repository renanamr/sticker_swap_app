import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_app/src/core/alerts/alert_dialog.dart';
import 'package:sticker_swap_app/src/core/entities/auth.dart';
import 'package:sticker_swap_app/src/modules/login/domain/usecases/login.dart';

class LoginBloc {

  final username = TextEditingController();
  final password = TextEditingController();
  bool validate = true;

  final auth = Modular.get<Auth>();
  final loginUseCase = Modular.get<ILogin>();

  final _loadingStream = BehaviorSubject.seeded(false);
  Stream<bool> get isLoading => _loadingStream.stream;

  Future<void> login() async {
    try{
      _loadingStream.sink.add(true);
      final authLogin = await loginUseCase(username.text, password.text);
      auth.token = authLogin.token;
      auth.refreshToken = authLogin.refreshToken;

      return toSyncUserData();
    }catch(e){
      alertMessage("E-mail e senha não conferem. Altere os dados e tente novamente.");
    }
    _loadingStream.sink.add(false);
  }

  void toSyncUserData() => Modular.to.pushReplacementNamed("/sync_user/");

  void toRegisterScreen() => Modular.to.pushNamed("/register/");

  void toRecoverScreen() => Modular.to.pushNamed("/recover/");


  void dispose() {
    username.dispose();
    password.dispose();
    _loadingStream.close();
  }

}