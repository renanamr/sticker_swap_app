class Register{
  final String name;
  final String email;
  final String password;
  final String username;

  Register({
    required this.name,
    required this.email,
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toMap(){
    return {'email': email, 'password': password, 'username': username};
  }
}