import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/modules/login/domain/usecases/login.dart';
import 'package:sticker_swap_app/src/modules/login/presenter/login_bloc.dart';
import 'package:sticker_swap_app/src/modules/login/presenter/login_screen.dart';

class LoginModule extends Module{
  @override
  void binds(i) {
    i.add<LoginBloc>(LoginBloc.new);
    i.add<ILogin>(LoginUseCase.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginScreen());
  }
}