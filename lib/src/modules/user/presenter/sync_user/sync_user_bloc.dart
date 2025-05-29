import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/core/alerts/alert_dialog.dart';
import 'package:sticker_swap_app/src/core/entities/auth.dart';
import 'package:sticker_swap_app/src/core/entities/user.dart';
import 'package:sticker_swap_app/src/modules/user/domain/usecases/get_user_by_id.dart';

class SyncUserBloc {
  final _user = Modular.get<User>();

  final _getUserUseCase = Modular.get<IGetUserByID>();

  void getUserData() async {
    try {
      final auth = Modular.get<Auth>();
      final user = await _getUserUseCase(auth.idUserAuthenticated!);

      _user.id = user.id;
      _user.firstName = user.firstName;
      _user.lastName = user.lastName;
      _user.email = user.email;
      _user.username = user.username;
      _user.image = user.image;

      Modular.to.pushNamedAndRemoveUntil('/home', (_) => false);
    } catch (e) {
      print(e);
      alertMessage("Ops... Não foi possível recuperar seus dados",
          onPressed: () =>
              Modular.to.pushNamedAndRemoveUntil('/login', (_) => false));
    }
  }
}
