import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/modules/register/presenter/register_bloc.dart';
import 'package:sticker_swap_app/src/modules/register/presenter/register_screen.dart';

class RegisterModule extends Module{
  @override
  void binds(i) {
    i.add<RegisterBloc>((i) => RegisterBloc());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const RegisterScreen());
  }
}