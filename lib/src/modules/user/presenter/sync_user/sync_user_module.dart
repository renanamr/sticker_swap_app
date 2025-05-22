import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/modules/user/presenter/sync_user/sync_user_bloc.dart';
import 'package:sticker_swap_app/src/modules/user/presenter/sync_user/sync_user_screen.dart';

class SearchUserChatModule extends Module{
  @override
  void binds(i) {
    i.add<SyncUserBloc>(SyncUserBloc.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => SyncUserScreen());
  }
}