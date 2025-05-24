import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:sticker_swap_app/src/core/alerts/alert_dialog.dart';
import 'package:sticker_swap_app/src/core/entities/album.dart';
import 'package:sticker_swap_app/src/modules/register/domain/entities/register.dart';
import 'package:sticker_swap_app/src/modules/register/domain/usecases/register_user.dart';
import 'package:sticker_swap_app/src/modules/sticker/domain/usecases/generate_base_album.dart';
import 'package:sticker_swap_app/src/modules/sticker/domain/usecases/get_album.dart';

class RegisterBloc{
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();

  final registerUserUseCase = Modular.get<IRegisterUser>();

  void toLoginPage()=> Modular.to.pushReplacementNamed("/login/");

  Future<void> register() async{
    if(passwordConfirm.text != password.text){
      alertMessage("Não foi possivel realizar o cadastro. Senhas não são iguais!");
      return;
    }

    //TODO: Colocar nome real
    final register = Register(
      email: email.text,
      password: password.text,
      name: "Renan Alves",
    );

    final success = await registerUserUseCase(register);

    if(success){
      await alertMessage("Usuário cadastrado com sucesso!");
      toLoginPage();
    }else{
      alertMessage("Ocorreu um erro inesperado ao realizar o cadastro, tente novamente mais tarde.");
    }
  }


  void setUpAlbum(userId){
    Album novo = generateAlbum();
    postAlbum(userId, novo.toJson());
  }

  void dispose(){
    email.dispose();
    password.dispose();
    passwordConfirm.dispose();
  }
}