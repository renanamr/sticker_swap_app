import 'package:sticker_swap_app/src/core/entities/user.dart';

abstract class IGetUser{
  Future<User> call ();
}

class GetUserImpl implements IGetUser{
  @override
  Future<User> call () async{
    return User(id: 1, username: "renan", name: "renan.rocha", image: "", email: "r@gamil,");
  }
}