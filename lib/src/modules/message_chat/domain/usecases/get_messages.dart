import 'package:sticker_swap_app/src/core/entities/album.dart';
import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message_place.dart';
import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message_simple.dart';
import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message_swap_stickers.dart';
import 'package:sticker_swap_app/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_app/src/utils/const/status_message_confirm.dart';


abstract class IGetMessages{
  Future<List<Message>> call({required int idChat, required int lastID});
}

class GetMessagesImpl implements IGetMessages{

  @override
  Future<List<Message>> call({required int idChat, required int lastID}) async{

    final albumSender = Album();
    final albumNeed = Album();

    albumNeed.collectionStickers = {
      1 : [
        Sticker(id: 0, text: "BRA 2", quantity: 1, idGroup: 1),
        Sticker(id: 0, text: "BRA 3", quantity: 1, idGroup: 1),
        Sticker(id: 0, text: "BRA 20", quantity: 1, idGroup: 1)
      ],
      2 : [Sticker(id: 0, text: "FWC 13", quantity: 1, idGroup: 1)]
    };

    albumSender.collectionStickers = {
      1 : [
        Sticker(id: 0, text: "BRA 7", quantity: 1, idGroup: 1),
        Sticker(id: 0, text: "BRA 5", quantity: 1, idGroup: 1)
      ],
      2 : [Sticker(id: 0, text: "FWC 22", quantity: 1, idGroup: 1)]
    };

    return idChat == 0 ? [
        MessageSwapStickers(
            id: 3,
            idSender: 1,
            status: StatusMessageConfirm.wait,
            stickersSender: albumSender,
            stickersNeed: albumNeed,
        ),
        MessagePlace(id: 5, idSender: 1, time: "14:30", place: "Leitura, Natal shopping", date: "15h", status: StatusMessageConfirm.wait),
        MessageSimple(id: 0, message: "Vc tem figurinhas pra trocar?", idSender: 0)
      ] : [
        MessageSimple(id: 2, message: "Tite não me levou para copa.", idSender: 1),
      ];
  }

}