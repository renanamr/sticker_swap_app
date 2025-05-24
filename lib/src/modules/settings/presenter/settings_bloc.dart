import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/core/alerts/alert_dialog.dart';
import 'package:sticker_swap_app/src/core/entities/user.dart';

class SettingsBloc{

  final user = Modular.get<User>();

  final email = TextEditingController();
  final password = TextEditingController();

  void setUserData(){
    email.text = user.email!;
  }

  void exitApp() {
    alertMessage(
        "Você tem certeza que deseja sair do Sticker Swap?",
        onPressed: (){Modular.to.pushReplacementNamed("/login/");},
        buttonText: "Sim");
  }

  void dispose(){
    email.dispose();
    password.dispose();
  }

}