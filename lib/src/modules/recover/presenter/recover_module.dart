import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/modules/recover/presenter/recover_bloc.dart';
import 'package:sticker_swap_app/src/modules/recover/presenter/recover_screen.dart';

class RecoverModule extends Module{
  @override
  void binds(i) {
    i.add<RecoverBloc>(RecoverBloc.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => RecoverScreen());
  }
}