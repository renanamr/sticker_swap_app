import 'package:sticker_swap_app/src/core/entities/album.dart';
import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message.dart';

class MessageSwapStickers extends Message{

  int status;
  Album stickersNeed;
  Album stickersSender;

  MessageSwapStickers({
    required super.id,
    required super.idSender,
    required this.stickersNeed,
    required this.stickersSender,
    required this.status,
    super.type = "suggestion",
    super.message = "Sujestão de troca",
  });


}