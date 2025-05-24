import 'package:sticker_swap_app/src/core/entities/album.dart';
import 'package:sticker_swap_app/src/modules/create_swap/domain/entities/reference_swap.dart';

abstract class IGetReferenceSwap{
  Future<ReferenceSwap> call({
    required int idSender,
    required int idOtherUser
  });
}

class GetReferenceSwap implements IGetReferenceSwap{

  @override
  Future<ReferenceSwap> call({
    required int idSender,
    required int idOtherUser
  }) async{
    try{
      return ReferenceSwap(stickersSender: Album(), stickersNeed: Album());
    }catch(e){
      rethrow;
    }
  }

}