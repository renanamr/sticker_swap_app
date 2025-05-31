import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_app/src/core/alerts/alert_dialog.dart';
import 'package:sticker_swap_app/src/core/entities/user.dart';
import 'package:sticker_swap_app/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_app/src/modules/chat/domain/usecases/create_chat.dart';
import 'package:sticker_swap_app/src/modules/user/domain/usecases/get_users_by_username.dart';

class SearchUserChatBloc{
  final _user = Modular.get<User>();
  final _createChatUseCase = Modular.get<ICreateChat>();
  final _getUsersByUsernameUseCase = Modular.get<IGetUsersByUsername>();

  List<User> users = <User>[];
  late List<Chat> _chats;

  TextEditingController searchController = TextEditingController();

  final BehaviorSubject<bool> _loadingStream = BehaviorSubject();
  Stream<bool> get isLoading => _loadingStream.stream;

  void initScreen(List<Chat> chats){
    _chats = chats;
  }


  void onSearch() async{
    try{
      _loadingStream.sink.add(true);
      final text = searchController.text;

      users = await _getUsersByUsernameUseCase(text);
      users.removeWhere((user)=> user.id == _user.id);

      _loadingStream.sink.add(false);
    }catch(e){
      _loadingStream.sink.addError(e);
    }
  }

  Future<void> createChat(User otherUser) async{
    try{
      _loadingStream.sink.add(true);
      Chat? newChat = await _createChatUseCase(user: _user, otherUser: otherUser);

      if(newChat != null) {
        _chats.insert(0, newChat);
        users.remove(otherUser);
        alertMessage("O chat foi adicionado a sua lista.");
      }

    }catch(e){
      alertMessage("Ops... Não foi possível criar o chat.");
    }
    _loadingStream.sink.add(false);
  }

  
  void dispose(){
    _loadingStream.close();
    searchController.dispose();
  }
}