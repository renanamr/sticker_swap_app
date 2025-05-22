import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/modules/user/presenter/sync_user/sync_user_bloc.dart';

class SyncUserScreen extends StatelessWidget {

  final controller = Modular.get<SyncUserBloc>();
  SyncUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
