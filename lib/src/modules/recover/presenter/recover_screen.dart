import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/modules/recover/presenter/recover_bloc.dart';

class RecoverScreen extends StatefulWidget {
  @override
  RecoverScreenState createState() => RecoverScreenState();
}

class RecoverScreenState extends State<RecoverScreen> {
  final TextEditingController _email = TextEditingController();
  bool _validate = true;

  final controller = Modular.get<RecoverBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recuperar senha'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 40, 5, 5),
              child: Text('Esqueceu a senha?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 30),
              child: Text('Por favor insira seu email para mudar sua senha.', style: TextStyle(fontWeight: FontWeight.w300)),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Email', 
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'email@example.com',
                    contentPadding: const EdgeInsets.all(0),
                    errorText: !_validate ? "Formato inválido" : null
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
                  child: const Text('Continuar'),
                  onPressed: () async{
                    setState(() {
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email.text) ? _validate = true: _validate = false;
                    });
                  },
                )),
          ],
        ));

  }

}