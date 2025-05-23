import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/core/entities/user.dart';
import 'package:sticker_swap_app/src/modules/user/domain/usecases/get_user.dart';

class SyncUserBloc{
  final _user = Modular.get<User>();

  final _getUserUseCase = Modular.get<IGetUser>();

  void getUserData() async {
    try{
      final user = await _getUserUseCase();

      _user.id = user.id;
      _user.name = user.name;
      _user.email = user.email;
      _user.username = user.username;
      _user.image = user.image;

      Modular.to.pushNamedAndRemoveUntil('/home', (_) => false);
    }catch(e){
      print(e);
      //TODO: Criar fluxo de erro
    }
  }

}