import 'package:flutter/material.dart';
import 'package:sticker_swap_app/src/modules/register/presenter/register_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {

  final controller = Modular.get<RegisterBloc>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar-se'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 40, 5, 60),
                child: Image.asset('assets/images/logo.png'),
              ),
              TextFormField(
                controller: controller.email,
                validator: required,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'email@example.com',
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: controller.username,
                validator: required,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Username',
                    prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: controller.firstName,
                validator: required,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Nome',
                    prefixIcon: const Icon(Icons.title),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: controller.lastName,
                validator: required,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Sobrenome',
                    prefixIcon: const Icon(Icons.title),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: controller.password,
                obscureText: true,
                validator: required,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Senha',
                    prefixIcon: const Icon(Icons.key),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: controller.passwordConfirm,
                obscureText: true,
                validator: required,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Confirmação da senha',
                    prefixIcon: const Icon(Icons.key),
                ),
              ),
              const SizedBox(height: 30,),
              StreamBuilder<bool>(
                initialData: false,
                stream: controller.isLoading,
                builder: (context, snapshot) {
                  if(snapshot.data == true){
                    return const Center(child: CircularProgressIndicator(),);
                  }else{
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: controller.register,
                      child: const Text('Cadastre-se'),
                    );
                  }
                }
              ),
            ],
          ),
        )
      )
    );
  }

  static String? required(String? value,) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }
  
}