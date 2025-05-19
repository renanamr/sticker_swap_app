import 'package:flutter/material.dart';
import 'package:sticker_swap_app/src/modules/login/presenter/login_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final controller = Modular.get<LoginBloc>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: SingleChildScrollView (
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(25, 60, 25, 40),
              child: Image.asset('assets/images/logo.png'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
                controller: controller.email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'email@example.com',
                    errorText: !controller.validate ? "Formato inválido" : null
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
                controller: controller.password,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.key),
                ),
              ),
            ),
            Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: TextButton(
                  onPressed: controller.toRecoverScreen,
                  child: const Text(
                    'Esqueceu a senha?',
                    style: TextStyle(color: Color.fromARGB(255, 31, 114, 240)),
                  ),
                ),
            ),
            ),
            Container(
                height: 80,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text('Log In'),
                  onPressed: () async{
                    setState(() {
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(controller.email.text)
                          ? controller.validate = true
                          : controller.validate = false;
                    });
                    controller.login();
                  },
                )),
            TextButton(
              onPressed: controller.toRegisterScreen,
              child: Text(
                'Registre-se',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        )
      )
    );
  }
}