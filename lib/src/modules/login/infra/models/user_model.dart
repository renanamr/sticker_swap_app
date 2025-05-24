import 'package:sticker_swap_app/src/core/entities/user.dart';

class UserModel extends User{

  UserModel({
    super.id,
    super.name,
    super.email,
    super.image,
    super.username,
  });
  
  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        image: map['image'],
        username: map['username'],
    );
  }

  static List<UserModel> listFromJson(List<dynamic> json){
    return (json)
        .map((e) => UserModel.fromMap(e as Map<String,dynamic>))
        .toList();
  }
}