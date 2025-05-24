import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/core/alerts/alert_dialog.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: 'enne@gmail.com');
    _password = TextEditingController(text: '****************');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Configurações'),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: buildProfileImage(),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      child: const Text(
                        'Mudar foto de perfil',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.edit),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: _password,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.remove_red_eye),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    margin: const EdgeInsets.only(top: 250),
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text('Sair'),
                      onPressed: () async {
                        alertMessage("Você tem certeza que deseja sair do Sticker Swap?", onPressed: (){Modular.to.pushReplacementNamed("/login/");}, buttonText: "Sim");
                      },
                    )
                  ),
                ],
              ),
            )));
  }
}

Widget buildProfileImage() => const CircleAvatar(
      radius: 55,
      backgroundImage: AssetImage('assets/images/profile_picture.png'),
    );
