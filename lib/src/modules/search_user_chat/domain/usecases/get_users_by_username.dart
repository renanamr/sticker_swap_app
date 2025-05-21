import 'package:sticker_swap_app/src/core/entities/user.dart';

abstract class IGetUsersByUsername{
  Future<List<User>> call (String username);
}

class GetUsersByUsernameImpl implements IGetUsersByUsername{

  @override
  Future<List<User>> call (String username) async{
    return [
      User(id: 1, username: "renan", name: "renan.rocha", image: "", email: "r@gamil,")
    ];
  }

}