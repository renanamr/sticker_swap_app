import 'package:sticker_swap_app/src/core/entities/user.dart';

class UserModel extends User{

  UserModel({
    super.id,
    super.firstName,
    super.lastName,
    super.email,
    super.image,
    super.username,
  });
  
  factory UserModel.fromMap(Map<String, dynamic> map){
    print(map);
    return UserModel(
        id: map['id'],
        firstName: map['first_name'],
        lastName: map["last_name"],
        email: map['email'],
        image: map['picture'],
        username: map['username'],
    );
  }

  static List<UserModel> listFromJson(List<dynamic> json){
    return (json)
        .map((e) => UserModel.fromMap(e as Map<String,dynamic>))
        .toList();
  }
}