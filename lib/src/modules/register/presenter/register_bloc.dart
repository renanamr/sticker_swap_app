import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_app/src/core/alerts/alert_dialog.dart';
import 'package:sticker_swap_app/src/modules/register/domain/entities/register.dart';
import 'package:sticker_swap_app/src/modules/register/domain/usecases/register_user.dart';

class RegisterBloc{
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();

  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final formKey = GlobalKey<FormState>();


  final registerUserUseCase = Modular.get<IRegisterUser>();

  final _loadingStream = BehaviorSubject.seeded(false);
  Stream<bool> get isLoading => _loadingStream.stream;

  void toLoginPage()=> Modular.to.pushReplacementNamed("/login/");

  Future<void> register() async{
    if(!formKey.currentState!.validate()){
      return;
    }

    if(passwordConfirm.text != password.text){
      alertMessage("Não foi possivel realizar o cadastro. Senhas não são iguais!");
      return;
    }

    _loadingStream.sink.add(true);

    final register = Register(
      email: email.text,
      password: password.text,
      username: username.text,
      firstName: firstName.text,
      lastName: lastName.text,
    );

    final success = await registerUserUseCase(register);

    _loadingStream.sink.add(false);
    if(success){
      await alertMessage("Usuário cadastrado com sucesso!");
      toLoginPage();
    }else{
      alertMessage("Ocorreu um erro inesperado ao realizar o cadastro, tente novamente mais tarde.");
    }
  }


  void dispose(){
    email.dispose();
    username.dispose();
    password.dispose();
    passwordConfirm.dispose();
    firstName.dispose();
    lastName.dispose();

    _loadingStream.close();
  }
}