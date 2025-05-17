import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_app/src/modules/sticker/domain/entities/sticker.dart';

class MessageSwapStickers extends Message{

  int status;
  List<Sticker> stickersNeed;

  MessageSwapStickers({
    required super.id,
    required super.idSender,
    required this.stickersNeed,
    required this.status,

  super.type = 1,
    super.message = "Sujestão de troca",
  });


}