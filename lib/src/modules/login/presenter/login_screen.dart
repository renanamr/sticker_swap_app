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
        appBar: AppBar(),
        body: SingleChildScrollView(
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
                controller: controller.username,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Username',
                    prefixIcon: const Icon(Icons.email),
                    errorText:
                        !controller.validate ? "Campo obrigatório" : null),
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
                  labelText: 'Senha',
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
            StreamBuilder(
              initialData: false,
              stream: controller.isLoading,
              builder: (context, snapshot) {
                if (snapshot.data!) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return _buttonLogin;
                }
              },
            ),
          ],
        )));
  }

  Widget get _buttonLogin {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 80,
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Login'),
              onPressed: () async {
                setState(() {
                  controller.validate = controller.username.text.isNotEmpty;
                });
                if (controller.validate) controller.login();
              },
            )),
        TextButton(
          onPressed: controller.toRegisterScreen,
          child: Text(
            'Registre-se',
            style: TextStyle(color: Colors.grey[600]),
          ),
        )
      ],
    );
  }
}
