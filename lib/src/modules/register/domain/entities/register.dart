class Register{
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String username;

  Register({
    required this.email,
    required this.password,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toMap(){
    return {
      'email': email,
      'password': password,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
    };
  }
}