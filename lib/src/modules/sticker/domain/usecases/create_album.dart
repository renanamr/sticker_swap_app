import 'package:sticker_swap_app/src/services/http_service.dart';

abstract class ICreateAlbum{
  Future<bool> call({required int userId, required album});
}

class CreateAlbumImpl extends ICreateAlbum{

  final _httpService = HttpService();

  @override
  Future<bool> call({required int userId, required album}) async{
    try{
      await _httpService.put(
          endpoint: "/api/usuario/$userId/album",
          extraHeaders: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          data: {"collectionStickers": album['collectionStickers']},
      );
      return true;
    }catch(e){
      return false;
    }
  }
}