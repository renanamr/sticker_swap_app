import 'package:sticker_swap_app/src/core/entities/user.dart';

abstract class IGetUserByID{
  Future<User> call (String idUser);
}

class GetUserByIDImpl implements IGetUserByID{

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