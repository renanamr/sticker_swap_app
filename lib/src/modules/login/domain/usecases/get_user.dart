import 'package:sticker_swap_app/src/core/entities/user.dart';

abstract class IGetUser{
  Future<User> call (String idUser);
}

class GetUserImpl implements IGetUser{


  @override
  Future<User> call(String idUser) async{
    try{
      return User(
        image: "",
        name: "Renan",
        email: "r@gmail",
        id: 1,
        username: "renan.rocha",
      );
    }catch(e){
      rethrow;
    }
  }

}