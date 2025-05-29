import 'package:sticker_swap_app/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_app/src/services/http_service.dart';

abstract class IUpdateSticker{
  Future<bool> call({required int userId, required Sticker sticker});
}

class UpdateStickerImpl extends IUpdateSticker{

  final _httpService = HttpService();

  @override
  Future<bool> call({required int userId, required Sticker sticker}) async{
    try{
      await _httpService.patch(
          endpoint: "stickers/${sticker.id}",
          extraHeaders: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          data: {"amount": sticker.quantity,}
      );
      return true;
    }catch(e){
      return false;
    }
  }
}