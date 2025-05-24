import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/core/alerts/alert_dialog.dart';

class RecoverBloc{
  void toLoginPage()=> Modular.to.pushReplacementNamed("/login/");

  void sendEmail() async{
    await alertMessage("E-mail de alteração de senha enviado com sucesso.");
    toLoginPage();
  }
}