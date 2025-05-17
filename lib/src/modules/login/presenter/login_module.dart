import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/modules/login/presenter/login_screen.dart';

class LoginModule extends Module{
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const Login());
  }
}