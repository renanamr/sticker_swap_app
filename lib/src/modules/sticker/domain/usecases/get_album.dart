import 'package:sticker_swap_app/src/core/entities/album.dart';
import 'package:sticker_swap_app/src/core/entities/user.dart';
import 'package:sticker_swap_app/src/services/http_service.dart';

abstract class IGetAlbum{
  Future<Album> call({required User user});
}

class GetAlbumImpl extends IGetAlbum{

  final _httpService = HttpService();

  @override
  Future<Album> call({required User user}) async{
    Album album = Album();

    final response = await _httpService.get(
      endpoint: "albuns/${user.id}",
      extraHeaders: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      }
    );

    album = Album.fromJson(response.data);
    return album;
  }
}