import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/modules/chat/domain/usecases/create_chat.dart';
import 'package:sticker_swap_app/src/modules/search_user_chat/domain/usecases/get_users_by_username.dart';
import 'package:sticker_swap_app/src/modules/search_user_chat/presenter/search_user_chat_bloc.dart';
import 'package:sticker_swap_app/src/modules/search_user_chat/presenter/search_user_chat_screen.dart';

class SearchUserChatModule extends Module{
  @override
  void binds(i) {
    i.add<SearchUserChatBloc>(SearchUserChatBloc.new);

    i.add<ICreateChat>(CreateChatImpl.new);
    i.add<IGetUsersByUsername>(GetUsersByUsernameImpl.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => SearchUserChatScreen(chats: r.args.data,));
  }
}