import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/modules/chat/presenter/chat_module.dart';
import 'package:sticker_swap_app/src/modules/home/presenter/home_bloc.dart';
import 'package:sticker_swap_app/src/modules/home/presenter/widgets/home_bottom_navigator_bar.dart';
import 'package:sticker_swap_app/src/modules/settings/presenter/settings_module.dart';
import 'package:sticker_swap_app/src/modules/sticker/presenter/sticker_module.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Modular.get<HomeBloc>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(statusBarColor: Color(0xff9A1032)),
        child: StreamBuilder<int>(
            initialData: 0,
            stream: controller.getIndexTela,
            builder: (_, snapshot) {
              return Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      if(snapshot.data == 0 || snapshot.data == 1)
                        StickerModule(idModePage: snapshot.data!,),
                      if(snapshot.data == 2)
                        const ChatModule(),
                      if(snapshot.data == 3)
                        const SettingsModule(),
                    ],
                  ),
                ),

                bottomNavigationBar: HomeBottomNavigatorBar(
                  onTap: controller.mudarTela,
                  indexTelaAtual: snapshot.data!,
                  selectedIconColor: Theme.of(context).primaryColor,
                ),
              );
            }
        )
    );
  }
}
