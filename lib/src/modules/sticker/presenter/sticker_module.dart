import 'package:flutter/widgets.dart';
import 'package:sticker_swap_app/src/config/widget_module_config.dart';
import 'package:sticker_swap_app/src/modules/sticker/domain/usecases/get_album.dart';
import 'package:sticker_swap_app/src/modules/sticker/domain/usecases/update_sticker.dart';
import 'package:sticker_swap_app/src/modules/sticker/presenter/sticker_bloc.dart';
import 'package:sticker_swap_app/src/modules/sticker/presenter/sticker_screen.dart';

class StickerModule extends WidgetModule{

  final int idModePage;
  const StickerModule({super.key, required this.idModePage});

  @override
  void binds(i) {
    i.add<StickerBloc>(StickerBloc.new);

    i.add<IGetAlbum>(GetAlbumImpl.new);
    i.add<IUpdateSticker>(UpdateStickerImpl.new);
  }

  @override
  Widget get view => StickerScreen(idModePage: idModePage,);

}