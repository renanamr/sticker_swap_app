import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sticker_swap_app/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_app/src/modules/chat/presenter/chat_bloc.dart';
import 'package:sticker_swap_app/src/modules/chat/presenter/widgets/chat_tile.dart';
import 'package:sticker_swap_app/src/modules/chat/presenter/widgets/search_chat.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final controller = Modular.get<ChatBloc>();

  @override
  void initState() {
    super.initState();
    controller.getChats();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text("Trocar figurinhas"),
          centerTitle: true,
        ),

        body: Column(
          children: [
            SearchChat(
                onSearch: controller.onSearch,
                controller: controller.searchController
            ),

            StreamBuilder<List<Chat>>(
              stream: controller.getChatsView,
              builder: (_, snapshot){
                if (snapshot.hasData){
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => ChatTile(
                        chat: snapshot.data![index],
                        onTap: controller.openChat,
                      ),
                    ),
                  );
                }else{
                  return const Center(child: CircularProgressIndicator(),);
                }
              }
            ),
          ],
        ),

        floatingActionButton: SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          tooltip: "Adicionar chat",
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Theme.of(context).primaryColor,
          overlayColor: Colors.black,
          overlayOpacity: 0.3,
          children: [
            SpeedDialChild(
              label: 'Escanear',
              child: const Icon(Icons.qr_code_scanner),
              labelStyle: const TextStyle(fontSize: 18.0),
              onTap: controller.openScanQrCode,
            ),
            SpeedDialChild(
                label: 'QrCode', 
                child: const Icon(Icons.qr_code),
                labelStyle: const TextStyle(fontSize: 18.0),
                onTap: controller.openQrCode,
            ),
            SpeedDialChild(
              label: 'Buscar',
              child: const Icon(Icons.search),
              labelStyle: const TextStyle(fontSize: 18.0),
              onTap: controller.searchUser,
            ),
          ],
        ),
      ),
    );
  }
}
