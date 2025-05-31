import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/modules/user/presenter/sync_user/sync_user_bloc.dart';

class SyncUserScreen extends StatefulWidget {
  const SyncUserScreen({super.key});

  @override
  State<SyncUserScreen> createState() => _SyncUserScreenState();
}

class _SyncUserScreenState extends State<SyncUserScreen> {
  final controller = Modular.get<SyncUserBloc>();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 600), controller.getUserData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/welcome_image.png',
                height: 300,
              ),
              const SizedBox(height: 24),
              Text(
                'Bem vindo',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 8),
              const Text(
                'Estamos organizando o app para você',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              const LinearProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
