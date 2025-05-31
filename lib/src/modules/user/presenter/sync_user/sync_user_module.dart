import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/modules/user/domain/usecases/get_user_by_id.dart';
import 'package:sticker_swap_app/src/modules/user/presenter/sync_user/sync_user_bloc.dart';
import 'package:sticker_swap_app/src/modules/user/presenter/sync_user/sync_user_screen.dart';

class SyncUserModule extends Module{
  @override
  void binds(i) {
    i.add<SyncUserBloc>(SyncUserBloc.new);
    i.add<IGetUserByID>(GetUserByIDImpl.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SyncUserScreen());
  }
}