import 'package:flutter/widgets.dart';
import 'package:sticker_swap_app/src/config/widget_module_config.dart';
import 'package:sticker_swap_app/src/modules/sticker/domain/usecases/get_album.dart';
import 'package:sticker_swap_app/src/modules/sticker/presenter/sticker_bloc.dart';
import 'package:sticker_swap_app/src/modules/sticker/presenter/sticker_screen.dart';

class StickerModule extends WidgetModule{

  int idModePage;
  StickerModule({super.key, required this.idModePage});

  @override
  void binds(i) {
    i.add<StickerBloc>((i) => StickerBloc());

    i.add<IGetAlbum>(GetAlbumImpl.new);
  }

  @override
  Widget get view => StickerScreen(idModePage: idModePage,);

}